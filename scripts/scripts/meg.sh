#!/bin/bash
session='meg'
dir="$HOME/sites/meg"

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
    tmux new -s $session -c $dir -d

    # Open NeoVim
    window=1
    tmux new-window -t $session:$window -n 'nvim' -c $dir 
    tmux rename-window -t $session:$window 'nvim'
    tmux send-keys -t $session:$window 'nvim' C-m # C-m executes

    # Open docker related windows
    window=2
    tmux new-window -t $session:$window -n 'git' -c $dir
    tmux send-keys -t $session:$window 'lazygit' C-m

    window=3
    tmux new-window -t $session:$window -n 'docker' -c $dir
    tmux split-window -t $session:$window.1 -h -c $dir
    tmux split-window -t $session:$window.1 -v -c $dir 
    tmux split-window -t $session:$window.3 -v -c $dir 
    tmux send-keys -t $session:$window.4 'docker compose up --build' C-m
    tmux send-keys -t $session:$window.3 'docker stats' C-m

    # # these commands depend on Docker running
    while ! docker exec meg-php-1 php --version; do sleep 1; done

    tmux send-keys -t $session:$window.1 'make web' C-m
    tmux send-keys -t $session:$window.2 'make queue' C-m


    window=4
    tmux new-window -t $session:$window -n 'workspace' -c $dir
    tmux send-keys -t $session:$window 'make enter' C-m

    # swap window 3 & 4
    tmux swap-window -s 3 -t 4
fi

# Get into the session
tmux attach -t $session
