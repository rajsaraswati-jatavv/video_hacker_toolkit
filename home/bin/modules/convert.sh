#!/bin/bash
# ============================================================================
# Video Format Conversion Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_convert() {
    local input_file output_file
    input_file="$(prompt_input)" || return 1
    
    echo -e "${CYAN}Select output format:${RESET}"
    echo "1) MP4  2) MKV  3) AVI  4) WEBM  5) MOV"
    read -p "Choice: " fmt_choice
    
    local ext="mp4"
    case $fmt_choice in
        2) ext="mkv" ;; 3) ext="avi" ;; 4) ext="webm" ;; 5) ext="mov" ;;
        *) ext="mp4" ;;
    esac
    
    local basename="${input_file%.*}"
    output_file="$(prompt_output "${basename}_converted.${ext}")" || return 1
    
    print_info "Converting $input_file to ${ext^^}..."
    if ffmpeg -i "$input_file" -c:v libx264 -c:a aac -movflags +faststart -y "$output_file" 2>/dev/null; then
        print_success "Conversion complete: $output_file"
    else
        print_error "Conversion failed!"
    fi
}
