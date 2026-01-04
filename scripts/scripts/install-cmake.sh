#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR=$(pwd)
TMP_DIR="/tmp"
BIN_DIR="$HOME/.local/bin"
DOWNLOAD_DIR="$TMP_DIR/cmake.tar.gz"
INSTALL_DIR="$HOME/.local/cmake"
VERSION="4.2.1"
OUTPUT_DIR="$TMP_DIR/cmake-$VERSION-linux-x86_64"

cd $TMP_DIR
curl -L -o "$DOWNLOAD_DIR" "https://github.com/Kitware/CMake/releases/download/v$VERSION/cmake-$VERSION-linux-x86_64.tar.gz"

tar -xzvf "$DOWNLOAD_DIR"

rm -rf "$INSTALL_DIR"
mv -v "$OUTPUT_DIR" "$INSTALL_DIR"
ln -s "$INSTALL_DIR/bin/cmake" "$BIN_DIR"

