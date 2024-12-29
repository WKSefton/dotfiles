. ~/.git-prompt.sh

RED='\[\e[1;31m\]'
BLUE='\[\e[1;34m\]'
RESET='\[\e[0m\]'
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "%s:")';
PROMPT_DIRTRIM=3
PS1="\${PS1_CMD1}${BLUE}\w${RESET}\r\n[\t]\$ "
