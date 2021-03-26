# Sgorblex's Fish Shell config
# ~/.config/fish/config.fish.d/fzf.fish
# FZF config

# Default fzf command
if command -v rg > /dev/null
	set -x FZF_DEFAULT_COMMAND "rg -L --files" 			# requires ripgrep (rg)

	# Search in hidden files
	function hfzf
		FZF_DEFAULT_COMMAND="rg -L --files --hidden" fzf
	end
end

# enter fzfound directory
alias fzcd	"cd (dirname (fzf))"
