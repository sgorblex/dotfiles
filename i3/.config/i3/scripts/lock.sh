#!/bin/sh
# Sgorblex's i3 config
# ~/.config/i3/scripts/lock.sh


if [ -f ~/.config/lockscreen.* ]; then
	BACKGROUND=~/.config/lockscreen.*
else
	BACKGROUND=~/.config/wallpaper.*
fi

echo back $BACKGROUND

i3lock $OPTIONS \
	--image $BACKGROUND \
	--fill \
	--indicator \
	--show-failed-attempts \
	--clock \
	--radius=130 \
	--ring-width=14 \
	--inside-color=ffffff44 \
	--ring-color=ffffff88 \
	--insidever-color=e8c50444 \
	--ringver-color=e8c504ff \
	--insidewrong-color=b7000044 \
	--ringwrong-color=b70000ff \
	--line-uses-inside \
	--bshl-color=e85400ff  \
	--keyhl-color=0245e2ff \
	--separator-color=ffffff77 \
	--verif-color=e8c504ff \
	--wrong-color=b70000ff \
	--time-color=ffffffee \
	--date-color=ffffffee \
	--date-str="%A %d/%m/%Y" \
	--verif-text="󰔟" \
	--wrong-text="󰌾" \
	--noinput-text="󰁮" \
	--time-font="Noto Mono Nerd Font" \
	--date-font="Noto Mono Nerd Font" \
	--verif-font="Material Design Icons Desktop" \
	--wrong-font="Material Design Icons Desktop" \
	--time-size=42 \
	--date-size=16 \
	--verif-size=90 \
	--wrong-size=90 \
	--pass-media-keys \

# useful material icons:
# 󰍁 󰌾 
# 󰒮 󰒫 󰓕 󰓖 
# 󰁮 󰭜 󰌍 
# 󱑆 󱑒 󰔚 󱎫 󰔛 󰔟 󰚭 󰞌 

# useful nerd fonts icons:
#  寧
