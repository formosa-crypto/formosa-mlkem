import os
import re
import sys

def parse_and_report(log_file, m_type, m_size, m_dir):
    """Reads log, parses results, and writes summary to GITHUB_STEP_SUMMARY."""
    
    results = {} #2:07.9]
    success_pattern = re.compile(r'\[✓\].*?\[\s*.*?\].*?\[\s*(\d+?:\d{2}\.\d).*?\]\s*(.*)')
    warning_pattern = re.compile(r'\[ϟ\]\s*(.*?):')
    error_pattern = re.compile(r'\[✗\].*?\[\s*.*?\].*?\[\s*(\d+?:\d{2}\.\d).*?\]\s*(.*)')

    if not os.path.exists(log_file):
        # Write a simple error message if the log wasn't created
        with open(os.environ.get('GITHUB_STEP_SUMMARY', '/dev/null'), 'a', encoding='utf-8') as f:
            f.write(f"## ❌ Error: Proof log file '{log_file}' not found.\n")
        sys.exit(0)

    # --- Parsing Logic ---
    with open(log_file, "r", encoding="utf-8") as f:
        for line in f:
            # Check for Success/Timing
            s_match = success_pattern.search(line)
            if s_match:
                duration = s_match.group(1)
                filepath = s_match.group(2).strip()
                filename = os.path.basename(filepath)                
                results.setdefault(filename, {"status": "❓ Pending", "time": "--", "warnings": 0})
                results[filename]["status"] = "✅"
                results[filename]["time"] = duration
                continue

            # Check for Warnings (ϟ)
            w_match = warning_pattern.search(line)
            if w_match:
                filepath = w_match.group(1).strip()
                filename = os.path.basename(filepath)
                
                results.setdefault(filename, {"status": "❓ Pending", "time": "--", "warnings": 0})
                results[filename]["warnings"] += 1
        
            e_match = error_pattern.search(line)
            if e_match:
                duration = e_match.group(1)
                filepath = e_match.group(2).strip()
                filename = os.path.basename(filepath)
                
                results.setdefault(filename, {"status": "❓ Pending", "time": "--", "warnings": 0})
                results[filename]["status"] = "❌"
                results[filename]["time"] = duration

    # --- Markdown Generation ---
    job_outcome = os.environ.get('PROOF_JOB_OUTCOME', 'failure')
    status_emoji = "✅" if job_outcome == "success" else "❌"

    markdown = [
        f"## Proof Summary: {m_type.capitalize()} MLKEM{m_size}({m_dir}) - {status_emoji}",
        "---",
        "| File | Status | Duration | Warnings |",
        "| --- | --- | --- | --- |"
    ]

    for filename in sorted(results.keys()):
        data = results[filename]
        
        status_display = data["status"]
        if status_display != "❓ Pending":
            warn_display = f"⚠️ {data['warnings']}" if data['warnings'] > 0 else "0"
            markdown.append(f"| `{filename}` | {status_display} | {data['time']} | {warn_display} |")

    # Write to GITHUB_STEP_SUMMARY
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'w', encoding='utf-8') as f:
        f.write("\n".join(markdown) + "\n\n")

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python <log_file> <type> <size> <dir>")
        sys.exit(1)
        
    log_file, m_type, m_size, m_dir = sys.argv[1:]
    parse_and_report(log_file, m_type, m_size, m_dir)