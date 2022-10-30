#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/input.sh
# Executes or repeats a given input script. Meant to script keyboard/mouse input.

set -e

# insert the script in this function
input(){
	xdotool mousedown 1
}

sleeptime(){
	sleep 1
}

repeat_toggle(){
	pidfile=/tmp/script_input.pid
	if [ -f /tmp/script_input.pid ]; then
		pid=$(cat "$pidfile")
		rm "$pidfile"
		notify-send -u critical "Stopping script"
		kill -9 $pid
	else
		sleeptime=${1:-1}
		echo $$ > $pidfile
		notify-send -u critical "Repeating script"
		while true; do
			input
			$sleeptime
		done
	fi
}

run(){
	input
}

repeat(){
	case "$1" in
		toggle)
			shift
			repeat_toggle
			;;
		*)
			echo Not implemented
			;;
	esac
}

case "$1" in
	run)
		shift
		run $@
		;;
	repeat)
		shift
		repeat $@
		;;
	*)
		echo "Not implemented"
		;;
esac
