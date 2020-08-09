#!/bin/sh
# Sgorblex's x config
# ~/.xinitrc

source ~/.xprofile


echo sleeping for testing purposes
sleep 10


# this assumes you have the selected WM installed
case $WM in
	"i3" )
		exec i3 ;;
	"xfce" )
		exec startxfce4 ;;
	"gnome" )
		export XDG_SESSION_TYPE=x11
		export GDK_BACKEND=x11
		exec gnome-session ;;
	"kde" | "plasma" )
		export DESKTOP_SESSION=plasma
		exec startplasma-x11 ;;
	"awesome" )
		exec awesome ;;
	"bsp" | "bspwm" )
		exec bspwm ;;
	"openbox" )
		exec openbox-session ;;
	* )
		echo "set a valid WM env variable first"
		exit 1 ;;
esac
