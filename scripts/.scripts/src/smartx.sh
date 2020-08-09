#!/bin/sh

# TODO
# fix argument and return values as echos instead of using global variables
# if flag options will be added, create an option for the part of the script which will be executed by startx (e.g. --startx <commands>)
# support multiple word names(?)
# ...



# if there's an argument, the script has been called by startx (see below)

if [[ -n $@ ]]
then
	# source user's xinitrc if present
	if [[ -f ~/.xinitrc ]]
	then
		source ~/.xinitrc
	fi


	# start the session chosen by smartx
	eval $@

	exit
fi


# add your WM's starting command in the list if it doesn't appear (don't leave it empty). If there's more then one, separate them with ; or &&. The last command must be the one which actually starts the session and should start with exec.
declare -A possible_sessions
possible_sessions[i3]="exec i3"
possible_sessions[Openbox]="exec openbox-session"
possible_sessions[bspwm]="exec bspwm"
possible_sessions[awesome]="exec awesome"
possible_sessions[Plasma]="export DESKTOP_SESSION=plasma; exec startplasma-x11"
possible_sessions[GNOME]="export XDG_SESSION_TYPE=x11; export GDK_BACKEND=x11; exec gnome-session"
possible_sessions[Xfce]="exec startxfce4"
possible_sessions[dwm]="exec dwm"


# identify what tui command to use
function tui_choose {
	for tui in whiptail dialog
	do
		if command -v $tui &> /dev/null
		then
			return
		fi
	done
	return 1
}


# is_display_taken checks if an X display is already open for the given number
function is_display_taken {
	for disp in $(ls /tmp/.X11-unix)
	do
		if [[ $1 -eq ${disp#X} ]]
		then
			return 0
		fi
	done
	return 1
}


# menu determines which sessions are available and lets the user choose
function menu {
	# for the sessions available, add name and null string for the tui (dialog/whiptail needs an item string for each object, since we don't use it we set it to NULL)
	menu_entries=()
	for session in ${!possible_sessions[@]}
	do
		full_cmd=${possible_sessions[$session]}
		exec_cmd=${full_cmd#*exec }
		if $(command -v ${exec_cmd% *} &> /dev/null)
		then
			menu_entries+=($session)
			[[ $tui == whiptail ]] && menu_entries+=('NULL')
		fi
	done

	local chosen_session=$($tui --title "smartx" --noitem --menu "Choose a window manager / desktop environment to start" 18 60 10 ${menu_entries[@]} 3>&1 1>&2 2>&3)
	
	echo $chosen_session
}




# exit if no tui command is available
if ! tui_choose
then
	echo "Your system doesn't have any recognized tui command"
	exit 1
fi


# set DISPLAY as the first non-used number
display=0
while $(is_display_taken $display)
do
	(( display++ ))
done

export DISPLAY=:$display


chosen_session=$(menu)
clear
if [[ -z $chosen_session ]]
then
	echo Canceled
	exit
fi

startx $0 ${possible_sessions[$chosen_session]}
