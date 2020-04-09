# Sgorblex's bash config
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default prompt (active if not overwritten after)
PS1='[\u@\h \W]\$ '



# Sourcing bash config folder for various configurations
if [ -d ~/.config/bash ]; then
	for f in ~/.config/bash/*; do
		source $f
	done
fi
