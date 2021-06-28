**NOTE**: this README is a WIP.

# Sgorblex's dotfiles
These are the dotfiles for my first and, at the moment, only rice.

## Modules
A module is a set of configuration files for a software. This repository is organized to use `stow`. Stow is a symbolic link manager and its purpose in this context is automatically creating symlinks to a module's configs in the right directories. Each module has its own directory in the repository. Each directory contains a tree of files relative to the user's HOME; for example at the moment the directory for the module `neovim` looks something like this:
```
neovim
├── .clang-format
└── .config
    ├── bash
    │   ├── editor.bashrc
    │   └── manpager.bashrc
    ├── fish
    │   └── config.fish.d
    │       ├── nvim-editor.fish
    │       ├── nvim-fzf.fish
    │       └── nvim-manpager.fish
    └── nvim
        ├── coc-settings.json
        ├── init.vim
        ├── plugins.conf.d
        │   ├── airline.conf.vimrc
        │   │   ...
        │   └── vimtex.conf.vimrc
        ├── plugins.conf.vimrc
        ├── plugs.vimrc
        │ ...
        └── spell
            ├── en.utf-8.add
            └── it.utf-8.add
```

Stow will create symbolic links in the directories `~/.config/nvim`, which contains the main configurations, `~/.config/bash`, and `~/.config/fish`, both containing neovim shell integrations, as well as a file named `.clang-format` in the user's HOME. Of course, it will manage eventual conflits: for example, the module `bash` uses `~/.config/bash`, but stow will put in a newly created directory both modules' symlinks. This system allows to divide the configs in packages and, at the same time, to manage integrations between modules.

See [modules](modules/) for a list of available modules.


### Install a module
To install one or more modules, clone this repository, `cd` into it, make sure you have `stow` installed and use the command:
```
stow -t $HOME <modules' names>
```

The parameter `-t $HOME` can be omitted if the repository was cloned in `$HOME`. Remember not to delete the cloned repository, since the files will only be linked, not copied.


### Upgrade a module
In the repository's directory, use the command:
```
git pull && stow -t $HOME -R <modules' names>
```

You might not need to use `stow` if there are no new or deleted files.


### Remove a module
In the repository's directory, use the command:
```
stow -t $HOME -D <module's name>
```



## Module info and dependencies
Each module has an information file stored in [modules](modules/). These files are organized to give a basic idea of what each software provides, including both mandatory and additional dependencies.

The software is referred to as Arch packages from official repositories or AUR, although it's not hard to find the respective packages in any distro or in the various GitHub repositories.

**NOTE**: information files are still a WIP: they may not exist or miss information. Feel free to report any problem in the repo's issues.
