# Sgorblex's Fish shell config
# ~/.config/fish/aliases.fish

# ls aliases
if command -v lsd > /dev/null
	alias ls	"lsd" 				# requires lsd
	alias tree	"lsd --tree"
end
alias l		"ls"
alias ll	"ls -l"
alias la	"ls -A"

# other
alias cls	"clear"
alias xc	"xclip -sel clip" 		# requires xclip
alias clk	"tty-clock -scC 4" 		# requires tty-clock
alias r		"ranger" 			# requires ranger
alias :q	"exit" 				# too much vim lol
alias pu	"pushd ."
alias po	"popd"
alias gs	"git status"

# cd+ls
function cl --wraps cd
	cd $argv && ls
end

# pacman aliases
alias ys 'yay -Slq | fzf --multi --preview "yay -Si {1} | grep -v \'Querying AUR...\'" | xargs -ro yay -S'
alias yr 'yay -Qq | fzf --multi --preview "yay -Qi {1}" | xargs -ro yay -Rs'

alias fn "find -name"
