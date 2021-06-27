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

# pacman aliases
alias ys 'yay -Slq | fzf --multi --preview "yay -Si {1} | grep -v \'Querying AUR...\'" | xargs -ro yay -S'
alias yr 'yay -Qq | fzf --multi --preview "yay -Qi {1}" | xargs -ro yay -Rs'

alias fn "find -name"

# for Nextcloud conflicts
set DIFF_COMMAND "nvim -d"
alias solve-conflict	"$DIFF_COMMAND (ls | grep conflicted) (ls | sed -n 's/\(.*\) (conflicted copy.*)\(.*\)/\1\2/p')"

alias tmp		'cd (mktemp -d)'
