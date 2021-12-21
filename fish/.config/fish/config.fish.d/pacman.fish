# Sgorblex's Fish Shell config
# ~/.config/fish/config.fish.d/fzf.fish
# Pacman aliases

# which package owns this command?
function pacwho
	if not command -v pacman &> /dev/null
		echo "missing pacman"
		return 1
	end
	if set bin (command -v $argv)
		pacman -Qo $bin
	else
		echo "Cannot find command $argv"
		return 1
	end
end

# fuzzy pacman (requires yay and fzf)
if command -v yay > /dev/null && command -v fzf > /dev/null
	# install with fzf
	function gimme --wraps "yay -S"
		argparse r/repo -- $argv
		or return

		# -r | --repo flag (official repos only)
		if set -q _flag_repo
			set repo --repo
		end

		yay -Slq $repo | fzf --prompt="pkg install > " --multi --preview "yay -Si {1} | grep -v 'Querying AUR...'" -q "$argv" | xargs -ro yay -S --needed
	end

	# uninstall with fzf
	function yeet --wraps "yay -Rs"
		string match -re -- '^-+' $argv >/dev/null && echo "yeet takes no options" 1>&2 && return
		yay -Qq | fzf --prompt="pkg remove > " --multi --preview "yay -Qi {1}" -q "$argv" | xargs -ro yay -Rns
	end
end
