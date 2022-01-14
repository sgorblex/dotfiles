#!/bin/sh

# Sgorblex's scripts
# ~/.scripts/vol.sh
# This script set default pulseaudio sinks' volume to the value percentage specified in the command-line argument (requires pulseaudio)


pactl set-sink-volume @DEFAULT_SINK@ ${1%\%}%
