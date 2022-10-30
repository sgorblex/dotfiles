#!/bin/sh
# Sgorblex's i3 config
# ~/.config/i3/scripts/immersive.sh
# Toggles immersive mode: tiny gaps and no Polybar

polybar-msg cmd toggle; i3-msg gaps inner all toggle 10
