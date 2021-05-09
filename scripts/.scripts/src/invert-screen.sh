#!/bin/sh

# see `xinput list`
TOUCH_SCREEN=12

if [ -f /tmp/inverted-screen ]; then
	xrandr --output $MONITOR_L --rotate normal
	rm /tmp/inverted-screen
else
	xrandr --output $MONITOR_L --rotate inverted
	touch /tmp/inverted-screen
fi
xinput map-to-output $TOUCH_SCREEN $MONITOR_L
