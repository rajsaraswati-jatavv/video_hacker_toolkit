#!/bin/bash
# ============================================================================
# Visual Effects Module
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

video_effects() {
    local input_file output_file
    input_file="$(prompt_input)" || return 1
    
    echo -e "${CYAN}Select effect:${RESET}"
    echo "1) Grayscale       2) Sepia"
    echo "3) Blur            4) Sharpen"
    echo "5) Invert colors   6) Speed up (2x)"
    echo "7) Slow down (0.5x) 8) Reverse"
    echo "9) Fade in/out     10) Vignette"
    read -p "Choice: " effect_choice
    
    local basename="${input_file%.*}"
    output_file="$(prompt_output "${basename}_effect.mp4")" || return 1
    
    local filter=""
    local extra_args=""
    case $effect_choice in
        1) filter="colorchannelmixer=.3:.4:.3:0:.3:.4:.3:0:.3:.4:.3" ;;
        2) filter="colorchannelmixer=.393:.769:.189:0:.349:.686:.168:0:.272:.534:.131" ;;
        3) filter="boxblur=5:1" ;;
        4) filter="unsharp=5:5:1.0:5:5:0.0" ;;
        5) filter="negate" ;;
        6) filter="" extra_args="-filter:v \"setpts=0.5*PTS\" -af \"atempo=2.0\"" ;;
        7) filter="" extra_args="-filter:v \"setpts=2.0*PTS\" -af \"atempo=0.5\"" ;;
        8) filter="" extra_args="-vf reverse -af areverse" ;;
        9) filter="fade=in:0:30,fade=out:st=30:d=5" ;;
        10) filter="vignette=angle=PI/4" ;;
        *) print_error "Invalid effect"; return 1 ;;
    esac
    
    print_info "Applying effect..."
    if [[ -n "$filter" ]]; then
        ffmpeg -i "$input_file" -vf "$filter" -c:a copy -y "$output_file" 2>/dev/null && \
        print_success "Effect applied: $output_file" || print_error "Effect failed!"
    else
        ffmpeg -i "$input_file" $extra_args -y "$output_file" 2>/dev/null && \
        print_success "Effect applied: $output_file" || print_error "Effect failed!"
    fi
}
