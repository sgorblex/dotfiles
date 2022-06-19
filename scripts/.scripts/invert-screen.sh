#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/invert-screen.sh
# Inverts the screen of convertible laptops. Inverts touch screen and pen input too, if present. $MONITOR_L must be sed and optionally also $TOUCH_SCREEN and/or $PEN.

TOUCH_SCREEN=${TOUCH_SCREEN:-$(xinput list | sed -n 's/.*Finger.*id=\([0-9]\+\).*/\1/p')}
PEN=${PEN:-$(xinput list | sed -n 's/.*Pen Pen.*id=\([0-9]\+\).*/\1/p')}

set -e

if [ -z "$MONITOR_L" ]; then
	printf "error: '$1' variable not set.\n" >&2
	exit 1
fi

if [ -f /tmp/inverted-screen ]; then
	xrandr --output "$MONITOR_L" --rotate normal
	rm /tmp/inverted-screen
else
	xrandr --output "$MONITOR_L" --rotate inverted
	echo > /tmp/inverted-screen
fi
printf "display inverted\n"

[ -n "$TOUCH_SCREEN" ] && xinput map-to-output "$TOUCH_SCREEN" "$MONITOR_L" && printf "touch screen inverted\n"
[ -n "$PEN" ] && xinput map-to-output "$PEN" "$MONITOR_L" && printf "pen input inverted\n"
