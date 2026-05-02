#!/bin/bash
# ============================================================================
# Video Hacker Toolkit - API Client
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

SERVER="${1:-http://localhost:8080}"

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║       Video Hacker Toolkit - API Client                     ║"
echo "║       By: RS JATAV | T3rmuxk1ng                             ║"
echo "╚══════════════════════════════════════════════════════════════╝"

if ! command -v curl &>/dev/null; then
    echo "[!] curl not found! Install with: pkg install curl (Termux) or apt install curl (Linux)"
    exit 1
fi

echo "[*] Connecting to $SERVER..."
echo

# Simple interactive API client
while true; do
    echo "Commands: convert | compress | cut | merge | audio | info | quit"
    read -p "vht> " cmd
    
    case $cmd in
        convert|compress|cut|merge|audio|info)
            read -p "File path: " filepath
            echo "[*] Sending $cmd request for: $filepath"
            curl -s "${SERVER}/api/${cmd}?file=${filepath}" 2>/dev/null || echo "[!] Request failed"
            echo
            ;;
        quit|exit|q)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "[!] Unknown command: $cmd"
            ;;
    esac
done
