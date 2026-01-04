#!/usr/bin/env bash
# https://syncthing.net/downloads/
VERSION="v2.0.12"
DIR_NAME="syncthing-linux-amd64-$VERSION"
DOWNLOAD_URL="https://github.com/syncthing/syncthing/releases/download/$VERSION/$DIR_NAME.tar.gz"
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/apps"

curl -L -o /tmp/syncthing.tar.gz $DOWNLOAD_URL
tar -xzf /tmp/syncthing.tar.gz -C /tmp

