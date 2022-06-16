#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/customshell.sh
# Used as shell launched from a terminal

tmuxinator def 2>/dev/null || tmux new -As default || $SHELL
