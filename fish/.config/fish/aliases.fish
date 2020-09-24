# Sgorblex's Fish shell config
# ~/.config/fish/aliases.fish

# ls aliases
alias ls	"lsd" 				# requires lsd
alias l		"ls"
alias ll	"ls -l"
alias la	"ls -A"

# other
alias cls	"clear"
alias pw	"lpass show -c --password" 	# requires lastpass-cli
alias xc	"xclip -sel clip" 		# requires xclip
alias clk	"tty-clock -scC 4" 		# requires tty-clock
alias r		"ranger" 			# requires ranger
alias :q	"exit" 				# too much vim lol
alias pu	"pushd ."
alias po	"popd"
