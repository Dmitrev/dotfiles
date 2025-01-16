#!/bin/bash

LOCAL_SYNCTHING_BIN="$HOME/.local/bin/syncthing"
GLOBAL_SYNCTHING_BIN="syncthing"
SYNCTHING_SESSION="syncthing"
SCRIPT_NAME=$(basename "$0")

if command -v "$GLOBAL_SYNCTHING_BIN" 2>&1 > /dev/null; then
    echo "syncthing found"
    SYNCTHING_BIN="$GLOBAL_SYNCTHING_BIN"
else
    if command -v "$LOCAL_SYNCTHING_BIN" 2>&1 > /dev/null; then
        SYNCTHING_BIN="$LOCAL_SYNCTHING_BIN"
    else
        echo "syncthing not found"
        exit 1
    fi
fi

if tmux has-session -t "$SYNCTHING_SESSION" 2>/dev/null; then
    echo "session exists"
else
    tmux new -s "$SYNCTHING_SESSION" -d
fi

if ps aux | grep syncthing | grep -v grep | grep -v "$SCRIPT_NAME"; then
    echo "syncthing is running"
else
    echo "syncthing is not running"
    tmux send-keys -t "$SYNCTHING_SESSION:^" "$SYNCTHING_BIN --no-browser" C-m
fi

