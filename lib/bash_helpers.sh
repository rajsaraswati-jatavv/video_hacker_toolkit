#!/bin/bash
# ============================================================================
# Video Hacker Toolkit - Bash Helpers
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

# Logging helper
log_msg() {
    local level="$1" msg="$2"
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    echo "[$timestamp] [$level] $msg"
}

log_info()  { log_msg "INFO" "$1"; }
log_warn()  { log_msg "WARN" "$1"; }
log_error() { log_msg "ERROR" "$1"; }

# Check if command exists
require_cmd() {
    if ! command -v "$1" &>/dev/null; then
        echo "[ERROR] Required command not found: $1"
        echo "        Install with: pkg install $1 (Termux) or apt install $1 (Linux)"
        return 1
    fi
    return 0
}

# Safe file operation
safe_rm() {
    for f in "$@"; do
        [ -f "$f" ] && rm -f "$f"
    done
}

# Progress indicator
show_progress() {
    local current="$1" total="$2"
    local percent=$((current * 100 / total))
    local filled=$((percent / 2))
    local empty=$((50 - filled))
    printf "\r[%-${filled}s%${empty}s] %d%%" "$(printf '#%.0s' $(seq 1 $filled 2>/dev/null))" "" "$percent"
}
