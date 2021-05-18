#!/bin/sh
# Sgorblex's i3 config
# ~/.config/i3/scripts/lock.sh


if [ -f ~/.config/lockscreen.* ]; then
	BACKGROUND=~/.config/lockscreen.*
else
	BACKGROUND=~/.config/wallpaper.*
fi

i3lock \
	-i $BACKGROUND \
	--indicator \
	-k \
	--pass-media-keys \
	--insidevercolor=e8c50444 \
	--insidewrongcolor=b7000044 \
	--insidecolor=ffffff44 \
	--ringvercolor=e8c504ff \
	--ringwrongcolor=b70000ff \
	--ringcolor=ffffff88 \
	--line-uses-inside \
	--keyhlcolor=0245e2ff \
	--bshlcolor=e85400ff  \
	--separatorcolor=ffffff77 \
	--verifcolor=e8c504ff \
	--wrongcolor=b70000ff \
	--datestr="%A %d/%m/%Y" \
	--timecolor=ffffffff \
	--datecolor=ffffffff \
	--time-font="Noto Mono Nerd Font" \
	--timesize=42 \
	--date-font="Noto Mono Nerd Font" \
	--datesize=16 \
	--verif-font="Material Design Icons Desktop" \
	--verifsize=90 \
	--veriftext="󰔟" \
	--wrong-font="Material Design Icons Desktop" \
	--wrongsize=90 \
	--wrongtext="󰌾" \
	--noinputtext="󰁮" \
	--radius=130 \
	--ring-width=14

# useful material icons:
# 󰍁 󰌾 
# 󰒮 󰒫 󰓕 󰓖 
# 󰁮 󰭜 󰌍 
# 󱑆 󱑒 󰔚 󱎫 󰔛 󰔟 󰚭 󰞌 

# useful nerd fonts icons:
#  寧
