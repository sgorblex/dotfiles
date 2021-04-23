# Sgorblex's tmux config
# ~/.tmux/tmuxline.tmux
# Tmux theme: tmuxline

# This tmux statusbar config was created by tmuxline.vim from Airline-themes Dark. A couple of little tweaks were done manually.

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=colour255,bg=colour238"
set -g status-right-style "none"
set -g pane-active-border-style "fg=colour190"
set -g status-style "none,bg=colour234"
set -g message-style "fg=colour255,bg=colour238"
set -g pane-border-style "fg=colour238"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=colour85,bg=colour234"
set -g status-left "#[fg=colour17,bg=colour190,bold] #S #[fg=colour190,bg=colour234,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour238,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour255,bg=colour238] %Y-%m-%d  %H:%M #[fg=colour190,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour17,bg=colour190] #h "

setw -g window-status-format "#[fg=colour244,bg=colour234] #I #[fg=colour250,bg=colour234] #W "

# setw -g window-status-current-format "#[fg=colour234,bg=colour190,nobold,nounderscore,noitalics]#[fg=colour17,bg=colour190] #I #[fg=colour17,bg=colour190,bold] #W #[fg=colour190,bg=colour234,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=colour234,bg=colour78,nobold,nounderscore,noitalics]#[fg=colour234,bg=colour78] #I #[fg=colour234,bg=colour78,bold] #W #[fg=colour78,bg=colour234,nobold,nounderscore,noitalics]"

# setw -g window-status-format "#[fg=colour78,bg=colour234] #I #[fg=colour85,bg=colour234] #W "

# setw -g window-status-format "#[fg=colour190,bg=colour234] #I #[fg=colour190,bg=colour234] #W "