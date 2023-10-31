#!/bin/sh

FHD_POS=above
FHD_POS=left-of
DISP_FILE=/tmp/display.info
INP_FILE=/tmp/input.info

TOUCH_SCREEN=$(xinput list | sed -n 's/.*Finger.*id=\([0-9]\+\).*/\1/p')
PEN=$(xinput list | sed -n 's/.*Pen Pen.*id=\([0-9]\+\).*/\1/p')
ERASER=$(xinput list | sed -n 's/.*Pen Eraser.*id=\([0-9]\+\).*/\1/p')

SECONDARY_R=eDP-1
SECONDARY_MON=$(xrandr | grep ' connected' | cut -d' ' -f1 | grep -v eDP-1 | head -1)
export SECONDARY_R
export SECONDARY_MON

lab() {
	if xrandr --output $SECONDARY_MON --mode 1920x1080 --${FHD_POS} $SECONDARY_R; then
		echo monitor mode: 1920x1080 ${FHD_POS%-of}
	elif xrandr --output $SECONDARY_MON --mode 1280x1024 --rate 75.02 --right-of $SECONDARY_R; then
		echo monitor mode: 1280x1024 right
	elif xrandr --output $SECONDARY_MON --mode 1024x768 --rate 75.02 --right-of $SECONDARY_R; then
		echo monitor mode: 1024x768 right
	else
		echo no xrandr mode found: falling back to single mode
		single
		return 1
	fi

	i3-msg workspace 11 && i3-msg gaps inner current set 0 && i3-msg workspace back_and_forth

	common

	printf 'lab:%s' "$SECONDARY_MON" > "$DISP_FILE"
}

single() {
	xrandr --auto

	common

	printf 'single' > "$DISP_FILE"
}

input() {
	printf '' > "$INP_FILE"
	if ! [ -z $PEN ]; then
		xinput map-to-output $PEN $SECONDARY_R
		printf '%s' $PEN > "$INP_FILE"
	fi
	printf ':' >> "$INP_FILE"
	if ! [ -z $ERASER ]; then
		xinput map-to-output $ERASER $SECONDARY_R
		printf '%s' $ERASER > "$INP_FILE"
	fi
}

common() {
	feh --bg-scale $HOME/.config/wallpaper.*

	[ -z $TOUCH_SCREEN ] ||	xinput map-to-output $TOUCH_SCREEN $SECONDARY_R

	input

	export BAR1_MONITOR=$SECONDARY_MON
	export BAR2_MONITOR=$SECONDARY_R
	polybar-msg cmd quit
	# pkill polybar
	polybar -q "$POLYBAR_1" & disown
	polybar -q "$POLYBAR_2" & disown
}

has_second_monitor() {
	[ -n "$SECONDARY_MON" ]
}

curr_mode() {
	if [ -f "$DISP_FILE" ]; then
		cut -d: -f1 "$DISP_FILE"
	else
		printf none
	fi
}

needs_input() {
	[ ! -f "$INP_FILE" ] || [ "$(cut -d: -f1 "$INP_FILE")" != "$PEN" ] || [ "$(cut -d: -f2 "$INP_FILE")" != "$ERASER" ]
}


if [ -n "$1" ]; then
	if [ "$1" = "--debug" -o "$1" = "-o" ]; then
		set -x
	elif [ "$1" = "--force" -o "$1" = "-f" ]; then
		if has_second_monitor; then
			echo forcing lab mode
			lab
		else
			echo forcing single mode
			single
		fi
	fi
fi

MODE=$(curr_mode)
echo current mode: $MODE
case "$MODE" in
	none)
		if has_second_monitor; then
			echo entering lab mode
			lab
		else
			echo entering single mode
			printf 'single' > "$DISP_FILE"
		fi
		;;
	single)
		if has_second_monitor; then
			echo switching to lab mode
			lab
		fi
		;;
	lab)
		if ! has_second_monitor; then
			echo switching to single mode
			single
		else
			echo keeping lab mode
			if [ "$SECONDARY_MON" != $(cut -d: -f2 "$DISP_FILE") ]; then
				echo resetting lab mode
				lab
			else
				if needs_input; then
					echo resetting inputs
					input
				fi
			fi
		fi
		;;
	*)
		printf 'UNKNOWN MODE (%s)!\n' "$MODE"
esac
