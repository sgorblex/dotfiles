# Polybar
[Polybar](https://github.com/polybar/polybar) is a fast and easy-to-use status bar.

I use Polybar for its modules structure, easy to use and powerful, and for its aesthetics.

Multiple bars are present in my configuration. At the moment I use two bars contained in the `cute` config file.

## Dependencies
- polybar

### Fonts
- Noto Mono Nerd Font for the `cute` bar
- Caskaydia Cove Nerd Font for the `nerdy` bar

### Additional Integrations
- a battery for the battery module (lol)
- a monitor with brightness for the brightness module
- correct mountpoints for the fs modules
- i3 for the i3 module
- pulseaudio for the pulseaudio module
- python-todoist-python (todoist-python PyPI package) and a `todoist_api_token` gnome-keyring entry for the todoist module. You can overwrite the `api_token` function in the [script](../polybar/.config/polybar/scripts/polybar-todoist.py) if you prefer some other token retrieval method
- scrot for the scrot nerdy module
- spotify and [polybar-spotify](https://github.com/Jvanrhijn/polybar-spotify) for the spotify module
- the [rofi module](rofi.md) for the powermenu module
- the [scripts module](scripts.md) for the invert-screen module

#### Env variables
These env variables are not strictly necessary since fallbacks are present, although the best way to set the config fields is to use these variables.

- `$BAR1_MONITOR` and `$BAR2_MONITOR` for choosing bar monitors
- `$SINK` (pulseaudio sink) for the pulseaudio module
- `$NETWORK_INTERFACE` for the network module
- `$MONITOR_L` for the brightness module
