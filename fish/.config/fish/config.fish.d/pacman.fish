# Sgorblex's Fish shell config
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

# fuzzy pacman (requires paru and fzf)
if command -v paru > /dev/null && command -v fzf > /dev/null
	# install with fzf
	function gimme --wraps "paru -S"
		argparse r/repo a/aur -- $argv
		or return

		# -r | --repo flag (official repos only, overrides --aur)
		# -a | --aur flag (AUR only)
		if set -q _flag_repo
			set repo --repo
		else if set -q _flag_aur
			set aur --aur
		end

		set pkgs (paru -Slq $repo $aur | fzf --prompt="pkg install > " --multi --preview "paru -Si {1}" -q "$argv")
		if test -n "$pkgs"
			echo paru -S --needed $pkgs
			paru -S --needed $pkgs
		end
	end

	# uninstall with fzf
	function yeet --wraps "paru -Rs"
		string match -re -- '^-+' $argv >/dev/null && echo "yeet takes no options" 1>&2 && return
		set pkgs (paru -Qq | fzf --prompt="pkg remove > " --multi --preview "paru -Qi {1}" -q "$argv")
		if test -n "$pkgs"
			echo paru -Rns $pkgs
			paru -Rns $pkgs
		end
	end
end
