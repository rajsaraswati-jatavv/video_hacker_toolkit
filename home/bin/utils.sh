#!/bin/bash
# ============================================================================
# Ultra Video Hacker Toolkit - Shared Utilities
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

# Color definitions
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

# Validate input file exists
validate_input() {
    if [[ -z "$1" ]]; then
        echo -e "${RED}[!] No input file specified${RESET}"
        return 1
    fi
    if [[ ! -f "$1" ]]; then
        echo -e "${RED}[!] File not found: $1${RESET}"
        return 1
    fi
    return 0
}

# Validate output path is writable
validate_output() {
    if [[ -z "$1" ]]; then
        echo -e "${RED}[!] No output file specified${RESET}"
        return 1
    fi
    local outdir
    outdir="$(dirname "$1")"
    if [[ ! -d "$outdir" ]]; then
        mkdir -p "$outdir" 2>/dev/null || {
            echo -e "${RED}[!] Cannot create output directory: $outdir${RESET}"
            return 1
        }
    fi
    return 0
}

# Print success message
print_success() {
    echo -e "${GREEN}[+] $1${RESET}"
}

# Print error message
print_error() {
    echo -e "${RED}[!] $1${RESET}"
}

# Print info message
print_info() {
    echo -e "${CYAN}[*] $1${RESET}"
}

# Get video duration in seconds
get_duration() {
    ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1" 2>/dev/null
}

# Get video resolution
get_resolution() {
    ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$1" 2>/dev/null
}

# Get video codec
get_codec() {
    ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "$1" 2>/dev/null
}

# Prompt for input file
prompt_input() {
    read -p "Enter input file path: " input_file
    if ! validate_input "$input_file"; then
        return 1
    fi
    echo "$input_file"
}

# Prompt for output file
prompt_output() {
    local default_name="${1:-output.mp4}"
    read -p "Enter output file path [$default_name]: " output_file
    output_file="${output_file:-$default_name}"
    echo "$output_file"
}
