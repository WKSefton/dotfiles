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
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias package-prune='paru -Rns $(pacman -Qdtq)'

source .bashrc_prompt
source .bashrc_ufw

tere() {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

source .bashrc_fzf

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
