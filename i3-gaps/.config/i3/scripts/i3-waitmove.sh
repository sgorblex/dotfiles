#!/bin/sh

set -e

PROGRAM=${0##*/}
USAGE="$PROGRAM: Move an i3 window as soon as it exists.
Usage: $PROGRAM [-c CLASS | -t TITLE] WORKSPACE [DELAY]
Tries to move all windows that match the specified criterium in workspace WORKSPACE every DELAY seconds until the move succeeds.

The criterium may be:
-c CLASS	window class
-t TITLE	window title"

if [ $# -lt 3 -o $# -gt 4 -o "$1" = "--help" ]; then
	printf "%s\n" "$USAGE"
	exit 0
fi

querytype=$1
querycontent=$2
workspace=$3
sleeptime=${4:-0.5}

if [ $querytype = '-c' ]; then
	query="[class=$querycontent]"
elif [ $querytype = '-t' ]; then
	query="[title=$querycontent]"
fi

while ! i3-msg "$query" move workspace "$workspace"; do
	sleep $sleeptime
done
