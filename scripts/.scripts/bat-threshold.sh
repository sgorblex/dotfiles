#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/bat-threshold.sh
# Sets the battery charge treshold using the sys filesystem.


set -e

isNumber(){
	case "$1" in
	   (*[!0-9]*|'') return 1;;
	   (*)           return 0;;
	esac
}

if ! isNumber "$1" || [ "$1" -lt 0 -o "$1" -gt 100 ]; then
	printf "%s\n" "Invalid threshold." >&2
	exit 1
fi
if [ "$1" -lt 20 -o "$1" -gt 80 ]; then
	printf "%s\n" "WARNING: this threshold could damage your battery in the long term." >&2
fi

echo "$1" | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
