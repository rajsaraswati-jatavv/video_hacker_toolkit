#!/bin/bash
# ============================================================================
# Video Merge Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_merge() {
    local output_file
    read -p "Enter video files (space-separated): " -a input_files
    
    if [[ ${#input_files[@]} -lt 2 ]]; then
        print_error "At least 2 video files required for merging"
        return 1
    fi
    
    for f in "${input_files[@]}"; do
        if ! validate_input "$f"; then
            return 1
        fi
    done
    
    output_file="$(prompt_output "merged_output.mp4")" || return 1
    
    # Create concat file
    local concat_file
    concat_file="$(mktemp /tmp/concat_XXXXXX.txt)"
    for f in "${input_files[@]}"; do
        echo "file '$(realpath "$f")'" >> "$concat_file"
    done
    
    print_info "Merging ${#input_files[@]} videos..."
    if ffmpeg -f concat -safe 0 -i "$concat_file" -c copy -y "$output_file" 2>/dev/null; then
        print_success "Merge complete: $output_file"
    else
        print_info "Trying re-encode merge..."
        ffmpeg -f concat -safe 0 -i "$concat_file" -c:v libx264 -c:a aac -y "$output_file" 2>/dev/null && \
        print_success "Merge complete (re-encoded): $output_file" || print_error "Merge failed!"
    fi
    
    rm -f "$concat_file"
}
