#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR=$(pwd)
INSTALL_DIR="$HOME/.local/apps/lowdown"
BIN_DIR="$HOME/.local/bin"
TEMP_DIR="/tmp/lowdown.zip"
VERSION="2_0_4"
BUILD_DIR="/tmp/lowdown-VERSION_$VERSION"
DOWNLOAD_URL="https://github.com/kristapsdz/lowdown/archive/refs/tags/VERSION_$VERSION.zip"

if [ -d "$INSTALL_DIR" ]; then
    rm -rv "$INSTALL_DIR"
fi
mkdir -p "$INSTALL_DIR"
curl -L -o "$TEMP_DIR" "$DOWNLOAD_URL"
unzip "$TEMP_DIR" -d "/tmp"

cd $BUILD_DIR
PREFIX="$INSTALL_DIR" ./configure
make install

