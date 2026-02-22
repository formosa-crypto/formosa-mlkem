#! /usr/bin/env python3

import functools as ft
import operator as op
import os
import yaml
import re
import sys

def tick(flag: bool) -> str:
    return "✅" if flag else "❌"

def parse_and_report(log_file: str, category: str):
    """Reads log, parses results, and writes summary to GITHUB_STEP_SUMMARY."""
    if not os.path.exists(log_file):
        # Write a simple error message if the log wasn't created
        with open(os.environ.get('GITHUB_STEP_SUMMARY', '/dev/null'), 'a', encoding='utf-8') as f:
            f.write(f"## ❌ Error: Proof log file '{log_file}' not found.\n")
        return

    with open(log_file) as stream:
        report = yaml.safe_load(stream)

    report = [report1 for test in report for report1 in test['details']]

    # --- Extract info from report ---
    results = {}

    for report1 in report:
        duration = report1['time']
        filepath = re.search(r'^.* \((.*)\)$', report1['name']).group(1)
        filename = os.path.basename(filepath)
        status   = report1['success'] == report1['shouldpass']

        results[filename] = dict(status = status, duration = duration)

    # --- Markdown Generation ---
    allok = ft.reduce(op.and_, (r1['status'] for r1 in results.values()), True)

    if 'PROOF_JOB_OUTCOME' in os.environ:
        allok &= os.environ.get('PROOF_JOB_OUTCOME') == 'success'

    markdown = [
        f"## Proof Summary: MLKEM ({category}) - {tick(allok)}",
        "---",
        "| File | Status | Duration |",
        "| ---- | ------ | -------- |"
    ]

    for filename in sorted(results.keys()):
        data = results[filename]
        markdown.append(f"| `{filename}` | {tick(data['status'])} | {data['duration']}|")

    markdown = "\n".join(markdown) + "\n"

    # Write to GITHUB_STEP_SUMMARY
    if 'GITHUB_STEP_SUMMARY' in os.environ:
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'w', encoding='utf-8') as f:
            f.write(markdown)
    else:
        # For debugging from CLI
        print(markdown)

if __name__ == "__main__":
    if len(sys.argv)-1 != 2:
        print("Usage: python <log_file> <category>", file = sys.stderr)
        sys.exit(1)
        
    log_file, category = sys.argv[1:]
    parse_and_report(log_file, category)
