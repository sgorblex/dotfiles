# Sgorblex's Fish Shell config
# ~/.config/fish/config.fish

# If not running interactively, don't do anything
if not status is-interactive
        exit
end


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

# Installing Fisher plugin manager if not present
if not functions --query fisher
	if command -v curl &> /dev/null
		curl --silent --location https://git.io/fisher | source && fisher update
	end
else if test -f ~/.config/fish/fish_plugins -a (fisher list | wc -l) -ne (cat ~/.config/fish/fish_plugins | wc -l)
	fisher update
end

if command -v zoxide &>/dev/null
	zoxide init fish | source
end

# Sourcing various configuration files
if test -d ~/.config/fish/config.fish.d 
	for f in ~/.config/fish/config.fish.d/*.fish
		source $f
	end
end

set -x PATH $PATH ~/.local/bin
