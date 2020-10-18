# Sgorblex's Fish shell config
# ~/.config/fish/config.fish.d/go.fish

# exporting default GOPATH
set -x GOPATH ~/.local/go

# adding go binaries to PATH
set -x PATH $PATH ~/.local/go/bin
