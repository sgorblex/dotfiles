# Sgorblex's Fish Shell config
# ~/.config/fish/config.fish

# Importing aliases
if [ -f ~/.config/fish/aliases.fish ]
	. ~/.config/fish/aliases.fish
end

# Deactivate welcome message
set fish_greeting

# Emulates vim style command line editing
fish_vi_key_bindings
bind -M insert \cf accept-autosuggestion

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore

# sourcing various configuration files
if [ -d ~/.config/fish/config.fish.d ]
	for f in ~/.config/fish/config.fish.d/*.fish
		. $f
	end
end
