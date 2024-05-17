#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/customshell.sh
# Used as shell launched from a terminal

sess=${1:-def}
tmuxinator "$sess" 2>/dev/null || tmux new -As "$sess" || $SHELL
