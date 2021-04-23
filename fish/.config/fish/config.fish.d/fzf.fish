# Sgorblex's Fish Shell config
# ~/.config/fish/config.fish.d/fzf.fish
# FZF config


alias fzf 'fzf --preview="__fzf_preview_file $expanded_token{}"'

# fzf configuration with fd (requires fd)
if command -v fd > /dev/null
	# default command
	set -x FZF_DEFAULT_COMMAND "fd -HLt f"

	# Search in non-hidden files
	alias nfzf 'FZF_DEFAULT_COMMAND="fd -Lt f" fzf'

	# enter fzfound directory
	alias fzcd 'FZF_DEFAULT_COMMAND="fd -LHt d" set fzfound (fzf) && cd $fzfound'
end
