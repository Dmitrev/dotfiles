#!/bin/bash
session='meg_frontend'
dir="$HOME/sites/meg-worktree/frontend"

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
    tmux new -s $session -c $dir -d

    # Open NeoVim
    # window=1
    # tmux new-window -t $session:$window -n 'nvim' -c $dir 
    tmux rename-window -t $session:$window 'nvim'
    tmux send-keys -t $session:$window 'nvim' C-m # C-m executes

    # # Open docker related windows
    window=2
    tmux new-window -t $session:$window -n 'docker' -c $dir
    tmux split-window -t $session:$window.1 -h -c $dir
    tmux split-window -t $session:$window.1 -v -c $dir 
    tmux split-window -t $session:$window.3 -v -c $dir 
    tmux send-keys -t $session:$window.4 'make up' C-m
    tmux send-keys -t $session:$window.3 'docker stats' C-m

    # # # these commands depend on Docker running
    cd $dir; while ! (docker compose ps --filter "status=running" | rg php); do sleep 1; done
    cd $dir; while ! (docker compose ps --filter "status=running" | rg nginx); do sleep 1; done

    tmux send-keys -t $session:$window.1 'make web' C-m
    tmux send-keys -t $session:$window.2 'make composerinstall && make queue' C-m
   
    window=3
    tmux new-window -t $session:$window -n 'workspace' -c $dir
    tmux send-keys -t $session:$window 'make enter' C-m
    
    # # swap window 2 & 3
    tmux swap-window -s 2 -t 3
fi

# Get into the session
tmux attach -t $session
