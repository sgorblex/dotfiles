#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/vol.sh
# Sets the volume of the default PulseAudio (or pipewire-pulse) sink to the value percentage specified in the command-line argument. Prints current volume if no argument is specified.


[ -z "$1" ] && pactl get-sink-volume @DEFAULT_SINK@ | sed -n 's/.*\/\s*\(.*\)\s*\/.*/\1/g;1p' || pactl set-sink-volume @DEFAULT_SINK@ ${1%\%}%
