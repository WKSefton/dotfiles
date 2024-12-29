#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

unalias -a

export EDITOR="nvim"

alias reload="source ~/.bashrc"
alias ec='nvim ~/.bashrc'
alias package-list='paru -Qqe > ~/.pkglist.paru.txt &'
alias package-prune='paru -Rns $(pacman -Qdtq)'

. ~/.bashrc_prompt.bash
. ~/.bashrc_ufw.bash
. ~/.bashrc_fzf.bash

tere() {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
