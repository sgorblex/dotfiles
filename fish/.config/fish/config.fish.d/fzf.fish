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
set FZF_LEGACY_KEYBINDINGS 0
set fzf_fd_opts -LHE .git
# unless pr #138 is accepted
set fzf_git_status_opts --preview='git diff --color=always {2}'
