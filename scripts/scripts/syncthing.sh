#!/bin/bash

SYNCTHING_BIN="$HOME/.local/bin/syncthing"
SYNCTHING_SESSION="syncthing"
SCRIPT_NAME=$(basename "$0")

if [ -f $SYNCTHING_BIN ]; then
    echo "syncthing found"
else
    echo "syncthing not found"
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

