#!/bin/sh
# Sgorblex's Ranger config
# ~/.config/ranger/plugin_check.sh


PLUGIN_DIR="$HOME/.config/ranger/plugins"
GH_PLUGINS="alexanderjeurissen/ranger_devicons jchook/ranger-zoxide sgorblex/ranger_mktemp"

# $1: base URL
# $2: plugin directory
install_with_git() {
	command -v git >/dev/null && git clone "$1/$2" "$PLUGIN_DIR/${2##*/}" >/dev/null 2>&1
}

# $1: owner/repo
install_from_github() {
	install_with_git "https://github.com" "$1"
}

mkdir -p "$PLUGIN_DIR"
for plugin in $GH_PLUGINS; do
	if [ ! -d "$PLUGIN_DIR/${plugin##*/}" ]; then
		install_from_github "$plugin"
	fi
done
