#!/bin/sh

# If tmux default session is present, attach to it, otherwise create it
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux attach -t default || tmux new -s default
fi
