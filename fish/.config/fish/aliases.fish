# Sgorblex's Fish shell config
# ~/.config/fish/aliases.fish

# ls aliases
if command -v lsd > /dev/null
	alias ls	"lsd" 			# requires lsd
	alias tree	"lsd --tree"
end
alias l			"ls"
alias ll		"ls -l"
alias la		"ls -A"

# other
alias cls		"clear"
alias :q		"exit" 			# too much vim lol
alias pu		"pushd ."
alias po		"popd"
alias gs		"git status"

if command -v ranger &>/dev/null
	alias r		"ranger" 		# requires ranger
end

if command -v xclip &>/dev/null
	alias xc	"xclip -sel clip" 	# requires xclip
end

# cd+ls
function cl --wraps cd
	cd $argv && ls
end

# pacman aliases (requires yay and fzf)
if command -v yay > /dev/null && command -v fzf > /dev/null
	# install with fzf
	function ys --wraps "yay -S"
		yay -Slq | fzf --prompt="pkg install > " --multi --preview "yay -Si {1} | grep -v 'Querying AUR...'" -q "$argv" | xargs -ro yay -S --needed
	end

	# install with fzf (official repos only)
	function ysr --wraps "yay -S --repo"
		yay -Slq --repo | fzf --prompt="official pkg install > " --multi --preview "yay -Si {1}" -q "$argv" | xargs -ro yay -S --needed
	end

	# uninstall with fzf
	function yr --wraps "yay -Rs"
		yay -Qq | fzf --prompt="pkg remove > " --multi --preview "yay -Qi {1}" -q "$argv" | xargs -ro yay -Rs
	end
end

function fn --wraps find
	find -iname "*$argv*"
end

# for Nextcloud conflicts
set DIFF_COMMAND "nvim -d"
alias solve-conflict	"$DIFF_COMMAND (ls | grep conflicted) (ls | sed -n 's/\(.*\) (conflicted copy.*)\(.*\)/\1\2/p')"

alias tmp		'cd (mktemp -d)'
