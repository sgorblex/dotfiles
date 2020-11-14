# Sgorblex's Bash config
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Sourcing bash config folder for various configurations
if [ -d ~/.config/bash ]; then
	for f in ~/.config/bash/*; do
		source $f
	done
fi
