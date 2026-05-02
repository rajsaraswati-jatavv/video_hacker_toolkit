#!/bin/bash
# ============================================================================
# Ultra Video Hacker Toolkit - Main Entry Point
# Author: RS JATAV | T3rmuxk1ng
# YouTube: https://youtube.com/@T3rmuxk1ng
# ============================================================================

VERSION="2.0.0"
TOOLKIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

# Source utilities
source "$TOOLKIT_DIR/utils.sh"

# Source all modules
for module in "$TOOLKIT_DIR/modules/"*.sh; do
    [ -f "$module" ] && source "$module"
done

show_banner() {
    echo -e "${CYAN}${BOLD}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║       ULTRA VIDEO HACKER TOOLKIT v${VERSION}                  ║"
    echo "║       By: RS JATAV | T3rmuxk1ng                             ║"
    echo "║       YouTube: https://youtube.com/@T3rmuxk1ng              ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

check_dependencies() {
    local deps=("ffmpeg" "ffprobe")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            echo -e "${RED}[!] $dep not found! Install with: pkg install ffmpeg (Termux) or apt install ffmpeg (Linux)${RESET}"
            exit 1
        fi
    done
    echo -e "${GREEN}[+] All dependencies satisfied${RESET}"
}

main_menu() {
    echo -e "${YELLOW}[1]${RESET}  Convert Video Format"
    echo -e "${YELLOW}[2]${RESET}  Compress Video"
    echo -e "${YELLOW}[3]${RESET}  Cut/Trim Video"
    echo -e "${YELLOW}[4]${RESET}  Merge Videos"
    echo -e "${YELLOW}[5]${RESET}  Extract Audio"
    echo -e "${YELLOW}[6]${RESET}  Add Watermark"
    echo -e "${YELLOW}[7]${RESET}  Create GIF"
    echo -e "${YELLOW}[8]${RESET}  Extract Text (OCR)"
    echo -e "${YELLOW}[9]${RESET}  Apply Effects"
    echo -e "${YELLOW}[10]${RESET} Batch Process"
    echo -e "${YELLOW}[11]${RESET} Video Info"
    echo -e "${YELLOW}[12]${RESET} Integrity Check"
    echo -e "${RED}[0]${RESET}  Exit"
    echo
    read -p "Select option: " choice

    case $choice in
        1) video_convert ;;
        2) video_compress ;;
        3) video_cut ;;
        4) video_merge ;;
        5) audio_extract ;;
        6) video_watermark ;;
        7) video_gif ;;
        8) video_ocr ;;
        9) video_effects ;;
        10) video_batch ;;
        11) video_info ;;
        12) video_integrity ;;
        0) echo -e "${GREEN}Goodbye!${RESET}"; exit 0 ;;
        *) echo -e "${RED}Invalid option!${RESET}" ;;
    esac
}

check_dependencies
show_banner

while true; do
    main_menu
    echo
    read -p "Press Enter to continue..."
done
