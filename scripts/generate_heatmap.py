import sys
from typing import List, Dict


class Colors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


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
                line_times[l] = time_taken
    return line_times

def get_easycrypt_lines(easycrypt_file_path: str) -> List[str]:
    with open(easycrypt_file_path, 'r') as f:
        return f.readlines()

def generate_heatmap(easycrypt_lines: List[str], line_times: Dict[int, float]):

    max_time = max(line_times.values())

    thresholds = [0.01, 0.1, 0.5, 0.9]  

    print(f"{Colors.BOLD}{'Line Number':<5} | {'Time (s)':<10} | Code{Colors.ENDC}")
    print("-" * 80)
    
    for i, line_content in enumerate(easycrypt_lines):
        line_num = i + 1
        
        time_sec = line_times.get(line_num, 0.0)
        
        
        time_ratio = time_sec / max_time
        
        line_color = Colors.ENDC
        
        if time_ratio > thresholds[3]:
            line_color = Colors.RED  
        elif time_ratio > thresholds[2]:
            line_color = Colors.YELLOW 
        elif time_ratio > thresholds[1]:
            line_color = Colors.BLUE  
        elif time_ratio > thresholds[0]:
            line_color = Colors.CYAN 
        
        cleaned_line = line_content.rstrip().expandtabs(4)
        
        time_display = f"{time_sec:.6f}"
        
        output_line = f"{line_color}{line_num:<5} {Colors.ENDC}| {line_color}{time_display:<10} {Colors.ENDC} | {line_color}{cleaned_line}"
        print(output_line)

def main():
    
    if len(sys.argv) != 3:
        print(f"Use: python {sys.argv[0]} <easycrypt_file> <tstats_output>", file=sys.stderr)
        sys.exit(1)

    easycrypt_file = sys.argv[1]
    time_file = sys.argv[2]

    easycrypt_lines = get_easycrypt_lines(easycrypt_file)
    line_times = parse_time_data(time_file)
    generate_heatmap(easycrypt_lines, line_times)

if __name__ == "__main__":
    main()