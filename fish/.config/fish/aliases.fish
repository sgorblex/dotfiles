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
alias lal		"ls -Al"

# other
alias cls		"clear"
alias :q		"exit" 			# too much vim lol
abbr -ag g		"git"

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

function fn --wraps find
	find -iname "*$argv*"
end

# for Nextcloud conflicts
set DIFF_COMMAND "nvim -d"
alias solve-conflict	"$DIFF_COMMAND (ls | grep conflicted) (ls | sed -n 's/\(.*\) (conflicted copy.*)\(.*\)/\1\2/p')"

alias tmp		'cd (mktemp -d)'

alias int-ip "ip a | sed -n 's/\s\+inet \([0-9\.]\+\).*global.*/\1/p'"

if command -v handlr &>/dev/null
	alias o "handlr open"
else
	alias o "xdg-open"
end

alias se sudoedit

alias latexdoc texdoc
