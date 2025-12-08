#!/bin/bash

sudo apt install coreutils sed git build-essential lowdown

CLONE_DIR="/tmp/btop"
INSTALL_DIR="$HOME/.local"
CURRENT_DIR=$(pwd)

rm -rf "$CLONE_DIR"
rm -rf "$INSTALL_DIR/btop"
git clone https://github.com/aristocratos/btop.git "$CLONE_DIR"

cd "$CLONE_DIR"
make DEBUG=true CXX=gcc
make install PREFIX="$INSTALL_DIR" 
make setcap PREFIX="$INSTALL_DIR" 
sudo make setuid PREFIX="$INSTALL_DIR" 
cd "$CURRENT_DIR"
