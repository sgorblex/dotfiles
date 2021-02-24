#!/bin/sh

# Sgorblex's i3 config
# ~/.config/i3/scripts/lock.sh

i3lock \
	-B 6 \
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
	--verif-font="Noto Mono Nerd Font" \
	--verifsize=90 \
	--veriftext="羽" \
	--wrong-font="Noto Mono Nerd Font" \
	--wrongsize=90 \
	--wrongtext="" \
	--noinputtext="寧" \
	--radius=130 \
	--ring-width=14
