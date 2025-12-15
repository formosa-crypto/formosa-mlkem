import sys
import os
from typing import List, Dict


def time_to_color(time_ratio: float) -> str:
    
    r = int(100 + (time_ratio * 155)) 
    g = int(200 - (time_ratio * 150)) 
    b = 0

    r = max(0, min(255, r))
    g = max(0, min(255, g))
    
    return f"rgb({r}, {g}, {b})"

def parse_time_data(time_file_path: str) -> Dict[int, float]:
    line_times = {}
    with open(time_file_path, 'r') as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) != 3:
                continue
            start_line = int(parts[0].split(':')[0])
            end_line = int(parts[1].split(':')[0])
            time_taken = float(parts[2])
            for l in range(start_line, end_line + 1):
                line_times[l] = max(line_times.get(l, 0.0), time_taken)
    return line_times

def get_easycrypt_lines(easycrypt_file_path: str) -> List[str]:
    with open(easycrypt_file_path, 'r') as f:
        return f.readlines()

def generate_html_report(easycrypt_lines: List[str], line_times: Dict[int, float], ec_filename: str) -> str:
    if not line_times:
        return ""

    max_time = max(line_times.values())
    
    html_content = [
        "<!DOCTYPE html>",
        "<html lang='en'>",
        "<head>",
        f"<title>HeatMap EasyCrypt Proofs: {os.path.basename(ec_filename)}</title>",
        "<style>",
        "body { font-family: sans-serif; margin: 20px; background: #1e1e1e; color: white; }",
        "h1 { color: #f0f0f0; }",
        "table { border-collapse: collapse; width: 100%; font-family: monospace; font-size: 14px; background: #2b2b2b; color: white; }",
        "th, td { border: 1px solid #444; padding: 4px 8px; text-align: left; }",
        ".line-num { width: 4%; text-align: right; background-color: #333; color: #ccc; }",
        ".time { width: 10%; font-weight: bold; text-align: right; }",
        ".code { white-space: pre; font-weight: bold; }",
        ".line-num-bg { background-color: inherit !important; }",
        "</style>",
        "</head>",
        "<body>",
        f"<h1>HeatMap Proofs: {os.path.basename(ec_filename)}</h1>",
        "<table>",
        "<thead><tr><th class='line-num'>Line Number</th><th class='time'>Time (s)</th><th>EasyCrypt Code</th></tr></thead>",
        "<tbody>"
    ]
    
    for i, line_content in enumerate(easycrypt_lines):
        line_num = i + 1
        time_sec = line_times.get(line_num, 0.0)
        time_ratio = time_sec / max_time if max_time > 0 else 0.0
        
        bg_color = time_to_color(time_ratio)
        
        cleaned_line = line_content.rstrip().expandtabs(4).replace('<', '&lt;').replace('>', '&gt;')
        
        row_style = f"style='background-color: {bg_color};'"
        time_display = f"{time_sec:.6f}" if time_sec > 0.0 else "0.000000"
        line_num_style = f"style='background-color: {bg_color};'"

        html_content.append(
            f"<tr {row_style}>"
            f"<td class='line-num' {line_num_style}>{line_num}</td>"
            f"<td class='time'>{time_display}</td>"
            f"<td class='code'>{cleaned_line}</td>"
            f"</tr>"
        )

    html_content.extend(["</tbody>", "</table>", "</body>", "</html>"])
    return "\n".join(html_content)


def main():
    
    if len(sys.argv) != 3:
        print(f"Usage: python {sys.argv[0]} <easycrypt_file> <time_execution_file>", file=sys.stderr)
        sys.exit(1)

    easycrypt_file = sys.argv[1]
    time_file = sys.argv[2]

    try:
        easycrypt_lines = get_easycrypt_lines(easycrypt_file)
        line_times = parse_time_data(time_file)
    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error processing data: {e}", file=sys.stderr)
        sys.exit(1)

    html_output = generate_html_report(easycrypt_lines, line_times, easycrypt_file)
    sys.stdout.write(html_output)


if __name__ == "__main__":
    main()