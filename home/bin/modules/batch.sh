#!/bin/bash
# ============================================================================
# Batch Processing Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_batch() {
    local input_dir output_dir
    read -p "Enter directory containing videos: " input_dir
    
    if [[ ! -d "$input_dir" ]]; then
        print_error "Directory not found!"
        return 1
    fi
    
    read -p "Output directory [./batch_output]: " output_dir
    output_dir="${output_dir:-./batch_output}"
    mkdir -p "$output_dir"
    
    echo -e "${CYAN}Batch operation:${RESET}"
    echo "1) Convert all to MP4  2) Compress all  3) Extract audio from all"
    read -p "Choice: " batch_choice
    
    local count=0
    local success=0
    
    for file in "$input_dir"/*; do
        [[ -f "$file" ]] || continue
        case "$(file -b --mime-type "$file")" in
            video/*) ;;
            *) continue ;;
        esac
        
        ((count++))
        local basename
        basename="$(basename "${file%.*}")"
        
        case $batch_choice in
            1)
                print_info "[$count] Converting: $basename"
                ffmpeg -i "$file" -c:v libx264 -c:a aac -movflags +faststart -y "$output_dir/${basename}.mp4" 2>/dev/null && ((success++))
                ;;
            2)
                print_info "[$count] Compressing: $basename"
                ffmpeg -i "$file" -c:v libx264 -crf 28 -preset medium -c:a aac -y "$output_dir/${basename}_compressed.mp4" 2>/dev/null && ((success++))
                ;;
            3)
                print_info "[$count] Extracting audio: $basename"
                ffmpeg -i "$file" -vn -acodec libmp3lame -ab 192k -y "$output_dir/${basename}.mp3" 2>/dev/null && ((success++))
                ;;
            *)
                print_error "Invalid batch operation"
                return 1
                ;;
        esac
    done
    
    print_info "Processed: $count files | Success: $success"
}
