#!/bin/sh
# Sgorblex's x config
# ~/.xinitrc

# otherwise applied by the display manager:
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

. ~/.xprofile

exec i3
