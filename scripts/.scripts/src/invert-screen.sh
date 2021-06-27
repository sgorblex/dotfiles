#!/bin/sh

if [ -z $MONITOR_L ]; then
	echo error: '$MONITOR_L' not set
	exit 1
fi

TOUCH_SCREEN=$(xinput list | sed -n 's/.*Finger.*id=\([0-9]\+\).*/\1/p')
PEN=$(xinput list | sed -n 's/.*Pen Pen.*id=\([0-9]\+\).*/\1/p')

if [ -f /tmp/inverted-screen ]; then
	xrandr --output $MONITOR_L --rotate normal
	rm /tmp/inverted-screen
else
	xrandr --output $MONITOR_L --rotate inverted
	touch /tmp/inverted-screen
fi
xinput map-to-output $TOUCH_SCREEN $MONITOR_L
xinput map-to-output $PEN $MONITOR_L
