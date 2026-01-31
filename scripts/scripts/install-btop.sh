#!/usr/bin/env bash

set -euo pipefail

# dependencies
# install-gcc
# install-cmake
# install-ninja-build
# install-lowdown

CLONE_DIR="/tmp/btop"
INSTALL_DIR="$HOME/.local/apps/btop"
CURRENT_DIR=$(pwd)

rm -rf "$CLONE_DIR"
rm -rf "$INSTALL_DIR"
git clone https://github.com/aristocratos/btop.git "$CLONE_DIR"

cd "$CLONE_DIR"
cmake -B build -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/tmp/test \
  -DCMAKE_CXX_COMPILER=g++ \
  -DCMAKE_CXX_STANDARD=23 \
  -DCMAKE_CXX_STANDARD_REQUIRED=ON \
  -DCMAKE_CXX_EXTENSIONS=OFF

cmake --build build
cmake --install build
