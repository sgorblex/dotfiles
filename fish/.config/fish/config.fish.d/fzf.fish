# Sgorblex's Fish Shell config
# ~/.config/fish/config.fish.d/fzf.fish
# FZF config


# fzf configuration with fd (requires fd)
if command -v fd &> /dev/null
	# enter fzfound directory
	function fzcd
		set dir (fd -LHt d -c always | fzf --ansi --preview "_fzf_preview_file {1}" --prompt="fuzzy cd > " -q "$argv") && cd $dir
	end
end

# PatrickF1/fzf.fish options
set FZF_LEGACY_KEYBINDINGS 0
set fzf_fd_opts --hidden --exclude=.git
