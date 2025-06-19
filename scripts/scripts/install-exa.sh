#!/bin/bash

# Define variables
EXA_DIR="$HOME/.local/apps/exa"
BIN_DIR="$HOME/.local/bin"

# Clone the exa repository
if [ ! -d "$EXA_DIR" ]; then
    git clone https://github.com/ogham/exa.git "$EXA_DIR"
else
    echo "Exa source directory already exists. Pulling latest changes."
    cd "$EXA_DIR" && git pull
fi

# Build exa
cd "$EXA_DIR"
cargo build --release

# Create symlink to the binary
if [ ! -d "$BIN_DIR" ]; then
    mkdir -p "$BIN_DIR"
fi

ln -sf "$EXA_DIR/target/release/exa" "$BIN_DIR/exa"
