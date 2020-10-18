# Sgorblex's Neovim config @ Fish Shell config
# ~/.config/fish/config.fish.d/fzf.fish
# FZF config

# Edit found files with neovim
alias nzim	'set fzfound (fzf) && nvim $fzfound'
alias hnzim	'set fzfound (hfzf) && nvim $fzfound'
