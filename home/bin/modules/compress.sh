#!/bin/bash
# ============================================================================
# Video Compression Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_compress() {
    local input_file output_file quality
    input_file="$(prompt_input)" || return 1
    
    read -p "Compression quality (1-51, lower=better, default: 28): " quality
    quality="${quality:-28}"
    
    if [[ $quality -lt 1 || $quality -gt 51 ]]; then
        print_error "Quality must be between 1 and 51"
        return 1
    fi
    
    local basename="${input_file%.*}"
    output_file="$(prompt_output "${basename}_compressed.mp4")" || return 1
    
    print_info "Compressing $input_file (CRF: $quality)..."
    if ffmpeg -i "$input_file" -c:v libx264 -crf "$quality" -preset medium -c:a aac -y "$output_file" 2>/dev/null; then
        local orig_size comp_size
        orig_size=$(du -h "$input_file" | cut -f1)
        comp_size=$(du -h "$output_file" | cut -f1)
        print_success "Compression complete: $output_file"
        print_info "Original: $orig_size → Compressed: $comp_size"
    else
        print_error "Compression failed!"
    fi
}
