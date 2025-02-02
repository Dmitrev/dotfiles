#!/bin/bash
BIN_DIR="$HOME/.local/bin"

if [ -d "$BIN_DIR" ]; then
    echo "dir: $BIN_DIR already exists."
    exit 0;
fi

echo "creating: $BIN_DIR"
mkdir "$BIN_DIR"

