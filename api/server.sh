#!/bin/bash
# ============================================================================
# Video Hacker Toolkit - API Server
# Author: RS JATAV | T3rmuxk1ng
# ============================================================================

PORT="${1:-8080}"
TOOLKIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║       Video Hacker Toolkit - API Server                     ║"
echo "║       By: RS JATAV | T3rmuxk1ng                             ║"
echo "║       Port: $PORT                                            ║"
echo "╚══════════════════════════════════════════════════════════════╝"

# Simple HTTP server using netcat or python
if command -v python3 &>/dev/null; then
    echo "[*] Starting server on port $PORT..."
    cd "$TOOLKIT_DIR"
    python3 -m http.server "$PORT" --bind 0.0.0.0
elif command -v python &>/dev/null; then
    echo "[*] Starting server on port $PORT..."
    cd "$TOOLKIT_DIR"
    python -m SimpleHTTPServer "$PORT"
else
    echo "[!] Python not found! Install python to use the API server."
    exit 1
fi
