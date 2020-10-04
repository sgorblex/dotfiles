# Sgorblex's Neovim config (fzf) @ Fish Shell config
# ~/.config/fish/config.fish.d/fzf.fish

# Default fzf command
set -x FZF_DEFAULT_COMMAND "rg -L --files" 			# requires ripgrep (rg)

# Search in hidden files
function hfzf
	FZF_DEFAULT_COMMAND="rg -L --files --hidden" fzf
end

# Edit found files with neovim
alias nzim	'set fzfound (fzf) && nvim $fzfound'
alias hnzim	'set fzfound (hfzf) && nvim $fzfound'
