# Sgorblex's Fish Shell config
# ~/.config/fish/config.fish.d/fzf.fish
# Pacman aliases

# which package owns this command?
function pacwho
	if not command -v which &> /dev/null
		echo "missing which"
		return 1
	end
	if not command -v pacman &> /dev/null
		echo "missing pacman"
		return 1
	end
	pacman -Qo (which $argv)
end
