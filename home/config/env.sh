#!/bin/bash
# ============================================================================
# Video Hacker Toolkit - Configuration
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

# Default FFmpeg settings
DEFAULT_CRF=23
DEFAULT_PRESET="medium"
DEFAULT_AUDIO_BITRATE="192k"
DEFAULT_VIDEO_CODEC="libx264"
DEFAULT_AUDIO_CODEC="aac"
DEFAULT_CONTAINER="mp4"

# GPU acceleration (auto-detect)
ENABLE_GPU=false
if command -v nvidia-smi &>/dev/null; then
    ENABLE_GPU=true
    DEFAULT_VIDEO_CODEC="h264_nvenc"
fi

# Output settings
OUTPUT_DIR="./output"
LOG_LEVEL="error"  # quiet, error, warning, info, verbose, debug
