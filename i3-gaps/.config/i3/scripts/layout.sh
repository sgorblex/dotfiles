#!/bin/sh

browser() {
	i3-msg "workspace 10"
	i3-msg "workspace 10; append_layout ~/.config/i3/layouts/firefox.json"
	(firefox > ~/.local/share/firefox.log) &
}

termL () {
	i3-sensible-terminal -e tmux attach -t default-2
}

termR () {
	i3-sensible-terminal -e tmux attach -t default
}

terminals () {
	tmux new -ds default
	tmux new -ds default-2 -t default
	i3-msg "workspace 1"
	termL &
	sleep 0.6
	i3-msg "workspace 2"
	termR &
}


browser
terminals
