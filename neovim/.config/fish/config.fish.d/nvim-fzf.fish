# Sgorblex's Neovim config @ Fish Shell config
# ~/.config/fish/config.fish.d/fzf.fish
# FZF config

# Edit found files with neovim
alias nzim 'set fzfound (FZF_DEFAULT_COMMAND="rg --files -L --hidden" fzf --preview="__fzf_preview_file $expanded_token{}") && nvim $fzfound'
