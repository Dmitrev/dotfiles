#!/bin/bash
APP_DIR="$HOME/.local/apps"

if [ -d "$APP_DIR" ]; then
    echo "dir: $APP_DIR already exists."
    exit 0;
fi

echo "creating: $APP_DIR"
mkdir "$APP_DIR"

