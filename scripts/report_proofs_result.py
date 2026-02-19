import os
import re
import sys

def parse_and_report(log_file, m_type, m_size, m_dir):    
    results = {} 
    success_pattern = re.compile(r'\[✓\].*?\[\s*.*?\].*?\[\s*(\d+?:\d{2}\.\d).*?\]\s*(.*)')
    error_pattern = re.compile(r'\[✗\].*?\[\s*.*?\].*?\[\s*(\d+?:\d{2}\.\d).*?\]\s*(.*)')

    if not os.path.exists(log_file):
        with open(os.environ.get('GITHUB_STEP_SUMMARY', '/dev/null'), 'a', encoding='utf-8') as f:
            f.write(f"## ❌ Error: Proof log file '{log_file}' not found.\n")
        sys.exit(0)

    with open(log_file, "r", encoding="utf-8") as f:
        for line in f:
            s_match = success_pattern.search(line)
            e_match = error_pattern.search(line)

            if s_match:
                duration = s_match.group(1)
                filepath = s_match.group(2).strip()
                filename = os.path.basename(filepath)                
                results[filename] = {"status": "✅", "time": duration }
            elif e_match:
                duration = e_match.group(1)
                filepath = e_match.group(2).strip()
                filename = os.path.basename(filepath)
                results[filename] = {"status": "❌", "time": duration }
    job_outcome = os.environ.get('PROOF_JOB_OUTCOME', 'failure')
    status_emoji = "✅" if job_outcome == "success" else "❌"

    markdown = [
        f"## Proof Summary: {m_type.capitalize()} MLKEM{m_size}({m_dir}) - {status_emoji}",
        "---",
        "| File | Status | Duration |",
        "| --- | --- | --- |"
    ]

    for filename in sorted(results.keys()):
        data = results[filename]
        
        status_display = data["status"]
        markdown.append(f"| `{filename}` | {status_display} | {data['time']}|")

    with open(os.environ['GITHUB_STEP_SUMMARY'], 'w', encoding='utf-8') as f:
        f.write("\n".join(markdown) + "\n\n")

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python <log_file> <type> <size> <dir>")
        sys.exit(1)
        
    log_file, m_type, m_size, m_dir = sys.argv[1:]
    parse_and_report(log_file, m_type, m_size, m_dir)