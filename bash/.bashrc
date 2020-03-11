# Sgorblex's bash config
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '



# Sourcing .bash_aliases for custom aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi



# Powerline-Shell (requires powerline-shell - pip install powerline-shell)
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Setting go path
export GOPATH=~/.local/go

# fuzzy finder for bash (integration with fzf for vim)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
