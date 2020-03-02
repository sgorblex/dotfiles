#!/bin/bash

# Sgorblex's scripts
# ~/.scripts/vol.sh
# This script set pulseaudio's sinks volume to the value percentage specified in the command-line argument (requires pulseaudio)


# pulseaudio command (for each sink)
for i in $(pacmd list-sinks | grep index | cut -d : -f 2); do
	pactl set-sink-volume $i $1%
done
