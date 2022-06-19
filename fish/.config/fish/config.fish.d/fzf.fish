# Sgorblex's Fish shell config
# ~/.config/fish/config.fish.d/fzf.fish
# FZF config


# fzf configuration with fd (requires fd)
if command -v fd &> /dev/null
	# enter fzfound directory
	if command -v lsd &> /dev/null
		function fzcd
			set dir (fd -LHt d -c always | fzf --ansi --preview "lsd --icon=always --color=always {1}" --prompt="fuzzy cd > " -q "$argv") && cd "$dir"
		end
	end
end


# PatrickF1/fzf.fish options
set fzf_fd_opts -LHE .git
