#!/bin/sh
tmuxinator def 2>/dev/null || tmux new -A default || $SHELL
