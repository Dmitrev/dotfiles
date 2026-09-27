#!/usr/bin/env bash
set -euo pipefail

PHPENV_DIR="$HOME/.local/apps/phpenv"
should_install=false

if [ -d "$PHPENV_DIR" ]; then
    read -p "phpenv directory already exists at $PHPENV_DIR, would you like to force (re)install it? (y/n): " -r force_reinstall

    if [[ "$force_reinstall" =~ ^[yY]$ ]]; then
        should_install=true
    fi
else
    echo "phpenv not found"
    should_install=true
fi

if $should_install; then
    echo "we should install"
    rm -rv "$PHPENV_DIR"
    git clone https://github.com/phpenv/phpenv.git "$PHPENV_DIR"
fi


