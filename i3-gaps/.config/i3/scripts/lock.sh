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
	--insidever-color=e8c50444 \
	--insidewrong-color=b7000044 \
	--inside-color=ffffff44 \
	--ringver-color=e8c504ff \
	--ringwrong-color=b70000ff \
	--ring-color=ffffff88 \
	--line-uses-inside \
	--keyhl-color=0245e2ff \
	--bshl-color=e85400ff  \
	--separator-color=ffffff77 \
	--verif-color=e8c504ff \
	--wrong-color=b70000ff \
	--date-str="%A %d/%m/%Y" \
	--time-color=ffffffff \
	--date-color=ffffffff \
	--time-font="Noto Mono Nerd Font" \
	--time-size=42 \
	--date-font="Noto Mono Nerd Font" \
	--date-size=16 \
	--verif-font="Material Design Icons Desktop" \
	--verif-size=90 \
	--verif-text="󰔟" \
	--wrong-font="Material Design Icons Desktop" \
	--wrong-size=90 \
	--wrong-text="󰌾" \
	--noinput-text="󰁮" \
	--radius=130 \
	--ring-width=14

# useful material icons:
# 󰍁 󰌾 
# 󰒮 󰒫 󰓕 󰓖 
# 󰁮 󰭜 󰌍 
# 󱑆 󱑒 󰔚 󱎫 󰔛 󰔟 󰚭 󰞌 

# useful nerd fonts icons:
#  寧
