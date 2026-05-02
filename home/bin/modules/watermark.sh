#!/bin/bash
# ============================================================================
# Watermark Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_watermark() {
    local input_file output_file watermark_text
    input_file="$(prompt_input)" || return 1
    
    echo -e "${CYAN}Watermark type:${RESET}"
    echo "1) Text watermark  2) Image watermark"
    read -p "Choice: " wm_choice
    
    local basename="${input_file%.*}"
    output_file="$(prompt_output "${basename}_watermarked.mp4")" || return 1
    
    if [[ "$wm_choice" == "2" ]]; then
        read -p "Enter watermark image path: " wm_image
        if [[ ! -f "$wm_image" ]]; then
            print_error "Watermark image not found!"
            return 1
        fi
        print_info "Adding image watermark..."
        ffmpeg -i "$input_file" -i "$wm_image" -filter_complex "overlay=10:10" -c:a copy -y "$output_file" 2>/dev/null && \
        print_success "Watermark added: $output_file" || print_error "Watermark failed!"
    else
        read -p "Enter watermark text: " watermark_text
        [[ -z "$watermark_text" ]] && { print_error "Text cannot be empty"; return 1; }
        print_info "Adding text watermark..."
        ffmpeg -i "$input_file" -vf "drawtext=text='$watermark_text':fontcolor=white:fontsize=24:x=10:y=10:shadowcolor=black:shadowx=2:shadowy=2" -c:a copy -y "$output_file" 2>/dev/null && \
        print_success "Watermark added: $output_file" || print_error "Watermark failed!"
    fi
}
