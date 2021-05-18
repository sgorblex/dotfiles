#!/bin/sh
# Sgorblex's x config
# ~/.xinitrc

# otherwise applied by the display manager:
xrandr --dpi 85 --output DP-1 --mode 1920x1080 --pos 1360x0 --rate 144.00 --primary --output DVI-I-1  --mode 1360x768 --pos 0x392
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

. ~/.xprofile

exec i3
