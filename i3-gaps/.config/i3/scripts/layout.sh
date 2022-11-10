#!/bin/sh
# Sgorblex's i3 config
# ~/.config/i3/scripts/layout.sh

browser() {
	i3-msg "workspace 10; append_layout ~/.config/i3/layouts/firefox.json"
	firefox &
}

termL () {
	i3-sensible-terminal -e tmuxinator def2
}

termR () {
	i3-sensible-terminal -e ~/.scripts/customshell.sh
}

terminals () {
	i3-msg "workspace 1"
	termL &
	sleep 1
	i3-msg "workspace 2"
	termR &
}


browser
terminals
