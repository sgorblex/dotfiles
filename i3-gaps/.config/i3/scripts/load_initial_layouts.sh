#!/bin/bash

# Sgorblex's i3 config
# ~/.scripts/i3/load_initial_layouts.sh

# workspace 10 (browser)
i3-msg "workspace 10; append_layout ~/.config/i3/layouts/firefox.json"
# firefox &

# workspace 1 (term 1)
i3-msg "workspace 1; append_layout ~/.config/i3/layouts/alacritty.json"
# alacritty &

# workspace 2 (term 2)
i3-msg "workspace 2; append_layout ~/.config/i3/layouts/alacritty.json"
# alacritty &
