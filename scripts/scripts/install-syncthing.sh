#!/usr/bin/env bash
# https://syncthing.net/downloads/
VERSION="v2.0.12"
SYNCTHING_DIR="syncthing-linux-amd64-$VERSION"
SYNCTHING_PATH="/tmp/$SYNCTHING_DIR"
DOWNLOAD_URL="https://github.com/syncthing/syncthing/releases/download/$VERSION/$SYNCTHING_DIR.tar.gz"
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/apps/syncthing"

if [ -d "$APP_DIR" ]; then
    echo "$APP_DIR already exists, cleaning up before installing.."
    rm -r "$APP_DIR"
fi

mkdir -pv "$APP_DIR"

curl -L -o /tmp/syncthing.tar.gz $DOWNLOAD_URL
tar -xzf /tmp/syncthing.tar.gz -C /tmp

mv -v $SYNCTHING_PATH/* "$APP_DIR"
ln -sv "$APP_DIR/syncthing" "$BIN_DIR"

