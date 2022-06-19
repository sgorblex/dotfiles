#!/bin/sh
# Sgorblex's i3 config
# ~/.config/i3/scripts/immersive.sh
# Toggles immersive mode: tiny gaps and no Polybar

if [ -f /tmp/i3-immersive.on ]; then
	polybar-msg cmd show; i3-msg gaps inner all set 10 && rm /tmp/i3-immersive.on
else
	polybar-msg cmd hide; i3-msg gaps inner all set 1 && touch /tmp/i3-immersive.on
fi
