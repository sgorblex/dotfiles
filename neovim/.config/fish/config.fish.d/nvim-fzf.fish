# Sgorblex's Neovim @ Fish shell config
# ~/.config/fish/config.fish.d/fzf.fish
# FZF config

if command -v fzf > /dev/null
	# Edit found files with neovim
	if command -v fd > /dev/null
		# alias nzim 'set fzfound (FZF_DEFAULT_COMMAND="fd -HLt f -c always" fzf --ansi --preview="_fzf_preview_file $expanded_token{}") && nvim $fzfound'
		function nzim
			set fzfound (fd -HLt f -c always | fzf --ansi --preview "bat --color=always {1}" --prompt="nzim > " -q "$argv") && nvim "$fzfound"
		end
	end
end
