#!/usr/bin/env bash

# Gruber Darker colors for Tmux

set -g mode-style "fg=#181818,bg=#ffb964"

set -g message-style "fg=#ffb964,bg=#262626"
set -g message-command-style "fg=#ffb964,bg=#262626"

set -g pane-border-style "fg=#262626"
set -g pane-active-border-style "fg=#ffb964"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#e4e4ef,bg=#181818"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#181818,bg=#ffb964,bold] #S #[fg=#ffb964,bg=#181818,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#181818,bg=#181818,nobold,nounderscore,noitalics]#[fg=#ffdd33,bg=#181818] #{pomodoro_status} #[fg=#262626,bg=#181818,nobold,nounderscore,noitalics]#[fg=#e4e4ef,bg=#262626] %Y-%m-%d  %I:%M %p #[fg=#ffb964,bg=#262626,nobold,nounderscore,noitalics]#[fg=#181818,bg=#ffb964,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#181818,bg=#181818,nobold,nounderscore,noitalics]#[fg=#ffdd33,bg=#181818] #{pomodoro_status} #[fg=#262626,bg=#181818,nobold,nounderscore,noitalics]#[fg=#e4e4ef,bg=#262626] %Y-%m-%d  %H:%M #[fg=#ffb964,bg=#262626,nobold,nounderscore,noitalics]#[fg=#181818,bg=#ffb964,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#f43753,bg=#181818"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#9e9e9e,bg=#181818"
setw -g window-status-format "#[fg=#181818,bg=#181818,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#181818,bg=#181818,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#181818,bg=#262626,nobold,nounderscore,noitalics]#[fg=#ffb964,bg=#262626,bold] #I  #W #F #[fg=#262626,bg=#181818,nobold,nounderscore,noitalics]"
