#!/bin/sh

ranger_devicons() {
		mkdir -p ~/.config/ranger/plugins
		git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons > /dev/null
}


if [ ! -d ~/.config/ranger/plugins/ranger_devicons ]; then
	ranger_devicons	&
fi
