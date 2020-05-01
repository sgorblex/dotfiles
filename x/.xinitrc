#!/bin/sh
# Sgorblex's x config
# ~/.xinitrc

source ~/.xprofile

if [[ -z $WM ]]; then
	echo "set WM env variable first"
elif [[ $WM == "i3" ]] || [[ $WM == "i3-gaps" ]]; then
	exec i3
elif [[ $WM == "xfce" ]]; then
	exec startxfce4
elif [[ $WM == "gnome" ]]; then
	export XDG_SESSION_TYPE=x11
	export GDK_BACKEND=x11
	exec gnome-session
else
	echo "WM not recognised"
fi
