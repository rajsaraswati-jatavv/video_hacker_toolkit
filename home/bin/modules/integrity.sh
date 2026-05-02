#!/bin/bash
# ============================================================================
# Video Integrity Check Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_integrity() {
    local input_file
    input_file="$(prompt_input)" || return 1
    
    print_info "Checking integrity of: $input_file"
    
    # Check if ffprobe can read the file
    if ffprobe -v error -count_frames -i "$input_file" 2>/dev/null; then
        print_success "File appears to be valid"
    else
        print_error "File may be corrupted or incomplete!"
    fi
    
    # Check for errors in the stream
    local error_count
    error_count="$(ffmpeg -v error -i "$input_file" -f null - 2>&1 | wc -l)"
    
    if [[ $error_count -eq 0 ]]; then
        print_success "No stream errors detected"
    else
        print_error "$error_count errors detected in stream"
        echo -e "${YELLOW}Run 'ffmpeg -v error -i \"$input_file\" -f null -' for details${RESET}"
    fi
    
    # Check file size
    local file_size
    file_size="$(stat -c%s "$input_file" 2>/dev/null || stat -f%z "$input_file" 2>/dev/null)"
    if [[ $file_size -eq 0 ]]; then
        print_error "File is empty (0 bytes)!"
    else
        print_info "File size: $(du -h "$input_file" | cut -f1)"
    fi
}
