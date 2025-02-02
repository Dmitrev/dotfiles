#!/bin/bash

SCRIPT_PATH=$(dirname $(realpath "$0"))
bash "$SCRIPT_PATH/util/apps-dir.sh"
bash "$SCRIPT_PATH/util/bin-dir.sh"

APPS_DIR="$HOME/.local/apps"
INSTALL_DIR="$APPS_DIR/ghostty"
BIN_DIR="$HOME/.local/bin/ghostty"

if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
fi

sudo apt install -y libgtk-4-dev libadwaita-1-dev pkg-config libglib2.0-dev

cd "$APPS_DIR"
git clone https://github.com/ghostty-org/ghostty
cd ghostty

# zig build -Doptimize=ReleaseFast
zig build -Doptimize=ReleaseFast -Dapp-runtime=glfw
