#!/bin/sh

PLUGIN_DIR=$HOME/.config/ranger/plugins
PLUGINS="ranger_devicons ranger_zoxide"

ranger_devicons() {
	command -v git >/dev/null && git clone https://github.com/alexanderjeurissen/ranger_devicons "$PLUGIN_DIR/ranger_devicons" >/dev/null 2>&1
}

ranger_zoxide() {
	command -v git >/dev/null && git clone https://github.com/jchook/ranger-zoxide "$PLUGIN_DIR/ranger_zoxide" >/dev/null 2>&1
}


plugin_check() {
	if [ ! -d "$PLUGIN_DIR/$1" ]; then
		$1 &
	fi
}

mkdir -p $PLUGIN_DIR
for plugin in $PLUGINS; do
	plugin_check $plugin
done
