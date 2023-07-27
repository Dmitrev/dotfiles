#!/bin/bash
session='dotfiles'
dir="$HOME/dotfiles"

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
    tmux new -s $session -c $dir -d

    # Open NeoVim
    tmux rename-window -t $session:$window 'nvim'
    tmux send-keys -t $session:$window 'nvim' C-m # C-m executes
fi

# Get into the session
tmux attach -t $session
