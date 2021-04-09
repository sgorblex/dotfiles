# Sgorblex's Fish Shell config
# ~/.config/fish/config.fish

# Importing aliases
if [ -f ~/.config/fish/aliases.fish ]
	source ~/.config/fish/aliases.fish
end

# Deactivate welcome message
set fish_greeting

# Emulates vim style command line editing
fish_vi_key_bindings --no-erase
bind -M insert \cx accept-autosuggestion

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore

# sourcing various configuration files
if test -d ~/.config/fish/config.fish.d 
	for f in ~/.config/fish/config.fish.d/*.fish
		source $f
	end
end

if test -z "$TMUX" && test -z $SSH_CONNECTION
	exec tmuxinator def
end
