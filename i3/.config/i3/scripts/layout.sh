#!/bin/sh
# Sgorblex's i3 config
# ~/.config/i3/scripts/layout.sh

browser() {
	i3-msg "workspace 10; append_layout ~/.config/i3/layouts/firefox.json"
	firefox &
}

mail() {
	i3-msg "workspace 9; append_layout ~/.config/i3/layouts/thunderbird.json"
	thunderbird &
}

notes() {
	i3-msg "workspace 6; append_layout ~/.config/i3/layouts/obsidian.json"
	obsidian &
}

terminals () {
	# i3-msg "workspace 1"
	# i3-sensible-terminal -e tmuxinator def2
	# sleep 1
	i3-msg "workspace 2"
	i3-sensible-terminal -e ~/.scripts/customshell.sh
}


mail
notes
browser
terminals
