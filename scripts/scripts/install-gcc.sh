#!/bin/bash
set -e

GCC_VERSION="15.2.0"
INSTALL_DIR="$HOME/.local/apps"
CURRENT_DIR=$(pwd)

# Download GCC
curl -L -o "/tmp/gcc-$GCC_VERSION.tar.gz" "https://ftp.gnu.org/gnu/gcc/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.gz"

# Extract
tar -xzf "/tmp/gcc-$GCC_VERSION.tar.gz" -C /tmp

# Enter source
cd "/tmp/gcc-$GCC_VERSION"

# Download prerequisites (gmp, mpfr, mpc, isl)
./contrib/download_prerequisites

# Create a separate build directory
mkdir -p /tmp/gcc-build
cd /tmp/gcc-build

# Configure
../gcc-$GCC_VERSION/configure --prefix="$INSTALL_DIR" --disable-multilib --enable-languages=c,c++

# Build (parallel)
make -j$(nproc)

# Install
make install

# Return to original directory
cd "$CURRENT_DIR"

echo "GCC $GCC_VERSION installed to $INSTALL_DIR"
