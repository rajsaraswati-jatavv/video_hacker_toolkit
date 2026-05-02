#!/bin/bash
# ============================================================================
# Video Cut/Trim Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_cut() {
    local input_file output_file start_time end_time
    input_file="$(prompt_input)" || return 1
    
    read -p "Start time (HH:MM:SS or seconds): " start_time
    read -p "End time (HH:MM:SS or seconds): " end_time
    
    if [[ -z "$start_time" || -z "$end_time" ]]; then
        print_error "Start and end time are required"
        return 1
    fi
    
    local basename="${input_file%.*}"
    output_file="$(prompt_output "${basename}_cut.mp4")" || return 1
    
    print_info "Cutting $input_file from $start_time to $end_time..."
    if ffmpeg -i "$input_file" -ss "$start_time" -to "$end_time" -c copy -y "$output_file" 2>/dev/null; then
        print_success "Cut complete: $output_file"
    else
        print_error "Cut failed! Try re-encoding:"
        ffmpeg -i "$input_file" -ss "$start_time" -to "$end_time" -c:v libx264 -c:a aac -y "$output_file" 2>/dev/null && \
        print_success "Cut complete (re-encoded): $output_file" || print_error "Cut failed!"
    fi
}
