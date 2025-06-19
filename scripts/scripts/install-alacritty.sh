#!/bin/bash

# Define variables
ALACRITTY_DIR="$HOME/.local/apps/alacritty"
BIN_DIR="$HOME/.local/bin"
DESKTOP_FILE="$HOME/.local/share/applications/alacritty.desktop"

# Install dependencies (adjust as necessary for your distribution)
sudo apt update
sudo apt install -y cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Clone the Alacritty repository
if [ ! -d "$ALACRITTY_DIR" ]; then
    git clone https://github.com/alacritty/alacritty.git "$ALACRITTY_DIR"
else
    echo "Alacritty source directory already exists. Pulling latest changes."
    cd "$ALACRITTY_DIR" && git pull
fi

# Build Alacritty
cd "$ALACRITTY_DIR"
cargo build --release

# Create symlink to the binary
if [ ! -d "$BIN_DIR" ]; then
    mkdir -p "$BIN_DIR"
fi

ln -sf "$ALACRITTY_DIR/target/release/alacritty" "$BIN_DIR/alacritty"

# Create .desktop file
cat <<EOL > "$DESKTOP_FILE"
[Desktop Entry]
Version=1.0
Name=Alacritty
Comment=A fast, cross-platform, OpenGL terminal emulator
Exec=$BIN_DIR/alacritty
Icon=alacritty
Type=Application
Categories=Terminal;Utility;
EOL

# Update desktop database
update-desktop-database ~/.local/share/applications

echo "Alacritty installed successfully!"

