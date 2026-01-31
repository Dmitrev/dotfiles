#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="$HOME/.local/apps/ninja"
BIN_DIR="$HOME/.local/bin"
TEMP_DIR="/tmp/ninja-linux.zip"
DOWNLOAD_URL="https://github.com/ninja-build/ninja/releases/download/v1.13.2/ninja-linux.zip"

curl -L -o "$TEMP_DIR" "$DOWNLOAD_URL"
unzip "$TEMP_DIR" -d "$INSTALL_DIR"
ln -sf "$INSTALL_DIR/ninja" "$BIN_DIR"
