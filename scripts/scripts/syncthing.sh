#!/usr/bin/env zsh

if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi

tmux new -d -s syncthing -- "$HOME/.local/bin/syncthing" --no-browser

