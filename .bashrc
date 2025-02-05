#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

unalias -a

MOZ_ENABLE_WAYLAND=1
export XCURSOR_THEME=Nordzy-cursors
export XCURSOR_SIZE=24

export EDITOR="nvim"

alias poe2="cd '/home/will/.steam/steam/steamapps/compatdata/2694490/pfx/drive_c/users/steamuser/Documents/My Games/Path of Exile 2/'"
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

tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }
