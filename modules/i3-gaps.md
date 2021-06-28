# i3-gaps
[i3-gaps](https://github.com/Airblader/i3) is a fork of the popular [i3](https://i3wm.org) [window manager](https://en.wikipedia.org/wiki/Window_manager) which adds some features, including gaps.

I use i3 for its [tiling](https://en.wikipedia.org/wiki/Tiling_window_manager) aspect and i3-gaps for aesthetics. Some prefer not to use gaps since they technically they take up some space: to address this issue I have an "immersive mode" keybinding which minimizes gaps and hides bars.

At the moment I use Polybar as bar (see the [Polybar module](polybar.md)), but many can be used, including i3-bar itsef.


## Dependencies
- i3-gaps


### Almost required
- feh and a wallpaper in .config/wallpaper.\*
- i3lock-color + xidlehook
- picom-git (see [its module](picom.md))
- polybar (see [its module](polybar.md))
- rofi (see [its module](rofi.md))
- the [scripts module](scripts.md)


### Additional Integrations

#### Scratchpads
- a `$TERMINAL` env variable + software
- python (3) and the i3ipc PyPI package
- discord
- qalculate-gtk
- spotify
- telegram-desktop
- todoist-electron

#### Miscellaneous
- a BROWSER env variable + software (see [x module](x.md))
- alacritty
- flameshot / scrot
- gromit-mpx
- konsole
- playerctl
- st

#### Just Autostart
- dunst (see [its module](dunst.md))
- nextcloud-client


### You already have these
- bash
- pulseaudio
- xorg
