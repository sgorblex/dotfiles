#!/bin/sh

# set -x
# echo script called at time $(date +%T) with args: $@ >> /tmp/lab.sh.log

TOUCH_SCREEN=$(xinput list | sed -n 's/.*Finger.*id=\([0-9]\+\).*/\1/p')
PEN=$(xinput list | sed -n 's/.*Pen Pen.*id=\([0-9]\+\).*/\1/p')
ERASER=$(xinput list | sed -n 's/.*Pen Eraser.*id=\([0-9]\+\).*/\1/p')

MONITOR_L=eDP-1
MONITOR_R=$(xrandr | grep ' connected' | cut -d' ' -f1 | grep -v eDP-1 | head -1)

lab() {
	echo LAB MODE
	if xrandr --output $MONITOR_R --mode 1920x1080 --above $MONITOR_L; then
		echo monitor mode: 1920x1080 above
	# if xrandr --output $MONITOR_R --mode 1920x1080 --pos 0x0 --output eDP-1 --pos 0x0; then
		# echo monitor mode: 1920x1080 above
	elif xrandr --output $MONITOR_R --mode 1280x1024 --rate 75.02 --right-of $MONITOR_L; then
		echo monitor mode: 1280x1024 right
	elif xrandr --output $MONITOR_R --mode 1024x768 --rate 75.02 --right-of $MONITOR_L; then
		echo monitor mode: 1024x768 right
	else
		echo no xrandr mode found: falling back to single mode
		single
		return 1
	fi

	i3-msg workspace 11 && i3-msg gaps inner current set 0 && i3-msg workspace back_and_forth

	common
}

single() {
	echo SINGLE MODE
	xrandr --auto

	common
}

common() {
	feh --bg-scale $HOME/.config/wallpaper.jpg

	[ -z $TOUCH_SCREEN ] ||	xinput map-to-output $TOUCH_SCREEN $MONITOR_L
	[ -z $PEN ] ||		xinput map-to-output $PEN $MONITOR_L
	[ -z $ERASER ] ||	xinput map-to-output $ERASER $MONITOR_L
}

if [ -n "$MONITOR_R" ]; then
	lab
else
	single
fi
