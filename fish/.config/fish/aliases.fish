# Sgorblex's Fish shell config
# ~/.config/fish/aliases.fish


# ls aliases
alias l			"ls"
alias ll		"ls -l"
alias la		"ls -A"
alias lal		"ls -Al"
if command -v lsd > /dev/null
	alias ls	"lsd" 			# requires lsd
	alias tree	"lsd --tree"
	alias ll	"lsd -Alg"
end

# other
alias cls		"clear"
alias :q		"exit" 			# too much vim lol
alias q			"exit"
abbr -ag g		"git"

alias r		"ranger" 		# requires ranger

alias xc	"xclip -sel clip" 	# requires xclip
function clip
	echo -n $argv | xc
end

# cd+ls
function cl --wraps cd
	cd $argv && ls
end

function fn --wraps find
	find -iname "*$argv*"
end

# for cloud conflicts
function solve-conflict
	for f in *.sync-conflict-*
		nvim -d "$f" (string replace -r 'sync-conflict-.*\.' '' $f)
	end
end


alias tmp		'cd (mktemp -d)'

alias int-ip "ip a | sed -n 's/\s\+inet \([0-9\.]\+\).*global.*/\1/p'"

if command -v handlr &>/dev/null
	alias o "handlr open"
else
	alias o "xdg-open"
end

alias se "sudo -E $EDITOR"

alias latexdoc texdoc

abbr --add t tea

alias mux tmuxinator

function rtfm -d "Open the manual for the current command, or the last one if the command line is empty"
	if not commandline | string length -q
		set cmd $history[1]
	else
		set cmd (commandline -p)
	end
	man (string split ' ' $cmd)[1]
end
