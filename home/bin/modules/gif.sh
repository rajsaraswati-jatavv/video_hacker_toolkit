#!/bin/bash
# ============================================================================
# GIF Creation Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_gif() {
    local input_file output_file start_time duration fps width
    input_file="$(prompt_input)" || return 1
    
    read -p "Start time (HH:MM:SS, default: 00:00:00): " start_time
    start_time="${start_time:-00:00:00}"
    
    read -p "Duration in seconds (default: 5): " duration
    duration="${duration:-5}"
    
    read -p "FPS (default: 15): " fps
    fps="${fps:-15}"
    
    read -p "Width in pixels (default: 480): " width
    width="${width:-480}"
    
    local basename="${input_file%.*}"
    output_file="$(prompt_output "${basename}.gif")" || return 1
    
    print_info "Creating GIF from $input_file..."
    if ffmpeg -ss "$start_time" -t "$duration" -i "$input_file" -vf "fps=$fps,scale=$width:-1:flags=lanczos" -y "$output_file" 2>/dev/null; then
        print_success "GIF created: $output_file"
    else
        print_error "GIF creation failed!"
    fi
}
