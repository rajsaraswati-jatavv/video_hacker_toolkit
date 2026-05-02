#!/bin/bash
# ============================================================================
# OCR Text Extraction Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_ocr() {
    local input_file
    input_file="$(prompt_input)" || return 1
    
    if ! command -v tesseract &>/dev/null; then
        print_error "Tesseract OCR not found! Install with: pkg install tesseract (Termux) or apt install tesseract-ocr (Linux)"
        return 1
    fi
    
    read -p "Timestamp to extract frame (HH:MM:SS, default: 00:00:01): " timestamp
    timestamp="${timestamp:-00:00:01}"
    
    local tmpdir
    tmpdir="$(mktemp -d /tmp/vht_ocr_XXXXXX)"
    local frame_path="$tmpdir/frame.png"
    local output_file="${input_file%.*}_ocr.txt"
    
    print_info "Extracting frame at $timestamp..."
    ffmpeg -ss "$timestamp" -i "$input_file" -frames:v 1 -y "$frame_path" 2>/dev/null || {
        print_error "Failed to extract frame"
        rm -rf "$tmpdir"
        return 1
    }
    
    print_info "Running OCR..."
    if tesseract "$frame_path" "${input_file%.*}_ocr" 2>/dev/null; then
        print_success "OCR text saved to: ${output_file}"
    else
        print_error "OCR failed!"
    fi
    
    rm -rf "$tmpdir"
}
