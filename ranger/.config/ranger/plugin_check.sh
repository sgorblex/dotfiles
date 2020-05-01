#!/bin/sh

ranger_devicons() {
		echo "Installing plugin: devicons"
		mkdir -p ~/.config/ranger/plugins
		git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
}


if [ ! -d ~/.config/ranger/plugins/ranger_devicons ]; then
	ranger_devicons	&
fi
