#!/bin/bash
session='notes'
dir="$HOME/Sync/obsidian/personal"

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
    tmux new -s $session -c $dir -d

    # Open NeoVim
    # window=1
    # tmux new-window -t $session:$window -n 'nvim' -c $dir 
    tmux rename-window -t $session:$window 'nvim'
    tmux send-keys -t $session:$window 'nvim' C-m # C-m executes
fi

# Get into the session
tmux attach -t $session
