#!/bin/bash
# ============================================================================
# Video Information Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_info() {
    local input_file
    input_file="$(prompt_input)" || return 1
    
    echo -e "${CYAN}══════════════════════════════════════════${RESET}"
    echo -e "${BOLD}Video Information: $input_file${RESET}"
    echo -e "${CYAN}══════════════════════════════════════════${RESET}"
    
    local duration resolution codec bitrate size
    duration="$(get_duration "$input_file")"
    resolution="$(get_resolution "$input_file")"
    codec="$(get_codec "$input_file")"
    bitrate="$(ffprobe -v error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 "$input_file" 2>/dev/null)"
    size="$(du -h "$input_file" | cut -f1)"
    
    echo -e "${GREEN}Duration:${RESET}   ${duration:-N/A} seconds"
    echo -e "${GREEN}Resolution:${RESET} ${resolution:-N/A}"
    echo -e "${GREEN}Codec:${RESET}      ${codec:-N/A}"
    echo -e "${GREEN}Bitrate:${RESET}    $((bitrate / 1000)) kbps"
    echo -e "${GREEN}File Size:${RESET}  $size"
    echo -e "${CYAN}══════════════════════════════════════════${RESET}"
    
    echo
    echo -e "${YELLOW}Full probe info:${RESET}"
    ffprobe -v error -show_format -show_streams "$input_file" 2>/dev/null | head -50
}
