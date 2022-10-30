#!/bin/sh

set -e

PROGRAM=${0##*/}
USAGE="$PROGRAM: Move an i3 window as soon as it exists.
Usage: $PROGRAM WINDOW_CLASS WORKSPACE [DELAY]
Tries to move all windows of class WINDOW_CLASS in workspace WORKSPACE every DELAY seconds until the move succeeds."

if [ $# -lt 2 -o $# -gt 3 -o "$1" = "--help" ]; then
	printf "%s\n" "$USAGE"
	exit 0
fi

class=$1
workspace=$2
sleeptime=${3:-0.5}

while ! i3-msg "[class=$class]" move workspace "$workspace"; do
	sleep $sleeptime
done
