#!/usr/bin/env bash

# Kanagawa (Wave) colors for Tmux

set -g mode-style "fg=#1F1F28,bg=#E6C384"

set -g message-style "fg=#E6C384,bg=#2D4F67"
set -g message-command-style "fg=#E6C384,bg=#2D4F67"

set -g pane-border-style "fg=#54546D"
set -g pane-active-border-style "fg=#7E9CD8"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#DCD7BA,bg=#1F1F28"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#1F1F28,bg=#7E9CD8,bold] #S #[fg=#7E9CD8,bg=#1F1F28,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#1F1F28,bg=#1F1F28,nobold,nounderscore,noitalics]#[fg=#E6C384,bg=#1F1F28] #{pomodoro_status} #[fg=#2D4F67,bg=#1F1F28,nobold,nounderscore,noitalics]#[fg=#DCD7BA,bg=#2D4F67] %Y-%m-%d  %I:%M %p #[fg=#7E9CD8,bg=#2D4F67,nobold,nounderscore,noitalics]#[fg=#1F1F28,bg=#7E9CD8,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#1F1F28,bg=#1F1F28,nobold,nounderscore,noitalics]#[fg=#E6C384,bg=#1F1F28] #{pomodoro_status} #[fg=#2D4F67,bg=#1F1F28,nobold,nounderscore,noitalics]#[fg=#DCD7BA,bg=#2D4F67] %Y-%m-%d  %H:%M #[fg=#7E9CD8,bg=#2D4F67,nobold,nounderscore,noitalics]#[fg=#1F1F28,bg=#7E9CD8,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#DCD7BA,bg=#1F1F28"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#727169,bg=#1F1F28"
setw -g window-status-format "#[fg=#1F1F28,bg=#1F1F28,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#1F1F28,bg=#1F1F28,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#1F1F28,bg=#2D4F67,nobold,nounderscore,noitalics]#[fg=#7E9CD8,bg=#2D4F67,bold] #I  #W #F #[fg=#2D4F67,bg=#1F1F28,nobold,nounderscore,noitalics]"
