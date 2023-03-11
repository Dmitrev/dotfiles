#!/bin/bash
session='meg'
dir="$HOME/sites/meg"

# Open NeoVim
window=0
tmux new -d -c $dir -s $session 
tmux split-window -t $session:$window.0 -h -c $dir
tmux split-window -t $session:$window.0 -v -c $dir 
tmux split-window -t $session:$window.2 -v -c $dir 
tmux send-keys -t $session:$window.3 'docker compose up --build' C-m
tmux send-keys -t $session:$window.2 'docker stats' C-m

# these commands depend on Docker running
while ! docker exec meg-php-1 php --version; do sleep 1; done

tmux send-keys -t $session:$window.0 'make web' C-m
tmux send-keys -t $session:$window.1 'make queue' C-m

window=1
tmux new-window -t $session:$window -n 'nvim' -c $dir 
tmux rename-window -t $session:$window 'nvim'
tmux send-keys -t $session:$window 'nvim' C-m # C-m executes

# Open docker related windows
window=2
tmux new-window -t $session:$window -n 'git' -c $dir
tmux send-keys -t $session:$window 'lazygit' C-m

window=3
tmux new-window -t $session:$window -n 'workspace' -c $dir
tmux send-keys -t $session:$window 'make enter' C-m

# Get into the session
tmux attach -t $session
