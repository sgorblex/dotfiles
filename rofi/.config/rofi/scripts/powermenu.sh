#!/bin/bash
# Sgorblex's rofi (@polybar @i3) config
# ~/.config/i3/scripts/powermenu.sh


# Rofi command (change settings here)
rofi_command="rofi -selected-row 4 -theme powermenu_theme.rasi"


# options
suspend="󰤄" 	# \UF0904 󰤄 
hibernate="󰋊" 	# \UF02CA 󰋊 
reboot="󰜉" 	# \UF0709 󰜉 
poweroff="󰐥"	# \UF0425 󰐥 
cancel="󰜺" 	# \UF073A 󰜺  <-- default
windows="󰖳" 	# \UF05B3 󰖳 
macos="󰀵" 	# \UF0035 󰀵 
lock="󰌾" 	# \UF033E 󰌾 
logout="󰿅" 	# \UF0FC5 󰿅 


# Menu entries setup
menu_entries="$suspend\n$hibernate\n$reboot\n$poweroff\n$cancel\n$windows\n$macos\n$lock\n$logout"


# custom mapping
xmodmap -e "keycode 44 = Down"
xmodmap -e "keycode 45 = Up"

# call Rofi
chosen="$(echo -e "$menu_entries" | $rofi_command -dmenu -window-title 'powermenu')"

# reset mapping
xmodmap -e "keycode 44 = j"
xmodmap -e "keycode 45 = k"


# do the thing
# note: for the sudo commands I recommend changing sudoers to make them executable without a password
case $chosen in
	$suspend)
		~/.config/i3/scripts/lock.sh
		systemctl suspend
		;;
	$hibernate)
		~/.config/i3/scripts/lock.sh
		systemctl hibernate
		;;
	$reboot)
		reboot
		;;
	$poweroff)
		poweroff
		;;
	$cancel)
		echo Operation canceled
		;;
	$windows)
		sudo grub-reboot "Windows"
		reboot
		;;
	$macos)
		sudo grub-reboot "MacOS X"
		reboot
		;;
	$lock)
		~/.config/i3/scripts/lock.sh
		;;
	$logout)
		i3-msg exit
		;;
esac
