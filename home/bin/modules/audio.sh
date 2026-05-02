#!/bin/bash
# ============================================================================
# Audio Extraction Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

audio_extract() {
    local input_file output_file
    input_file="$(prompt_input)" || return 1
    
    echo -e "${CYAN}Select audio format:${RESET}"
    echo "1) MP3  2) AAC  3) WAV  4) FLAC  5) OGG"
    read -p "Choice: " fmt_choice
    
    local ext="mp3" codec="libmp3lame"
    case $fmt_choice in
        2) ext="aac"; codec="aac" ;;
        3) ext="wav"; codec="pcm_s16le" ;;
        4) ext="flac"; codec="flac" ;;
        5) ext="ogg"; codec="libvorbis" ;;
        *) ext="mp3"; codec="libmp3lame" ;;
    esac
    
    local basename="${input_file%.*}"
    output_file="$(prompt_output "${basename}.${ext}")" || return 1
    
    print_info "Extracting audio from $input_file..."
    if ffmpeg -i "$input_file" -vn -acodec "$codec" -ab 192k -y "$output_file" 2>/dev/null; then
        print_success "Audio extracted: $output_file"
    else
        print_error "Audio extraction failed!"
    fi
}
