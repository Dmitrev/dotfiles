#!/usr/bin/env bash

# Gruvbox Material colors for Tmux (matches kitty current-theme.conf)

set -g mode-style "fg=#282828,bg=#d8a657"

set -g message-style "fg=#d8a657,bg=#665c54"
set -g message-command-style "fg=#d8a657,bg=#665c54"

set -g pane-border-style "fg=#665c54"
set -g pane-active-border-style "fg=#d8a657"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#d4be98,bg=#282828"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#282828,bg=#d8a657,bold] #S #[fg=#d8a657,bg=#282828,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#282828,bg=#282828,nobold,nounderscore,noitalics]#[fg=#d8a657,bg=#282828] #{pomodoro_status} #[fg=#665c54,bg=#282828,nobold,nounderscore,noitalics]#[fg=#d4be98,bg=#665c54] %Y-%m-%d  %I:%M %p #[fg=#d8a657,bg=#665c54,nobold,nounderscore,noitalics]#[fg=#282828,bg=#d8a657,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#282828,bg=#282828,nobold,nounderscore,noitalics]#[fg=#d8a657,bg=#282828] #{pomodoro_status} #[fg=#665c54,bg=#282828,nobold,nounderscore,noitalics]#[fg=#d4be98,bg=#665c54] %Y-%m-%d  %H:%M #[fg=#d8a657,bg=#665c54,nobold,nounderscore,noitalics]#[fg=#282828,bg=#d8a657,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#d4be98,bg=#282828"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#a89984,bg=#282828"
setw -g window-status-format "#[fg=#282828,bg=#282828,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#282828,bg=#282828,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#282828,bg=#665c54,nobold,nounderscore,noitalics]#[fg=#d8a657,bg=#665c54,bold] #I  #W #F #[fg=#665c54,bg=#282828,nobold,nounderscore,noitalics]"
