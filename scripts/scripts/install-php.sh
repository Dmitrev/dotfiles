#!/bin/bash

# Define variables
PHP_VERSION="8.3.25"
PHP_SOURCE_DIR="$HOME/.local/apps/php/$PHP_VERSION"
PHP_BIN_DIR="$HOME/.local/bin"

# Install dependencies
sudo apt update
sudo apt install -y openssl libssl-dev libcurl4-openssl-dev pkg-config build-essential autoconf bison re2c \
                    libxml2-dev libsqlite3-dev libicu-dev libonig-dev
# Create directories
mkdir -p "$PHP_SOURCE_DIR"
mkdir -p "$PHP_BIN_DIR"

# Clone the PHP source code
git clone --branch "PHP-$PHP_VERSION" https://github.com/php/php-src.git "$PHP_SOURCE_DIR"

# Change to the PHP source directory
cd "$PHP_SOURCE_DIR" || exit

# Prepare the build
./buildconf --force
./configure --prefix="$PHP_SOURCE_DIR" --with-config-file-path="$PHP_SOURCE_DIR" --enable-mbstring --with-curl --with-openssl --with-zlib --enable-soap --enable-intl --with-mysqli --with-pdo-mysql --with-jpeg-dir --with-png-dir --with-freetype-dir

# Compile and install
make
make install

# Create a symlink to the PHP binary
ln -sf "$PHP_SOURCE_DIR/bin/php" "$PHP_BIN_DIR/php"

# Add the bin directory to PATH if not already present
if ! echo "$PATH" | grep -q "$PHP_BIN_DIR"; then
    echo "export PATH=\"\$PATH:$PHP_BIN_DIR\"" >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
fi

echo "PHP $PHP_VERSION installed successfully!"
