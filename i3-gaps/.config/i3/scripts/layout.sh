#!/bin/sh

i3-msg "workspace 10"
i3-msg "workspace 10; append_layout ~/.config/i3/layouts/firefox.json"
(firefox > ~/.local/share/firefox.log) &
i3-msg "workspace 1"
i3-sensible-terminal &
sleep 1
i3-msg "workspace 2"
i3-sensible-terminal &
