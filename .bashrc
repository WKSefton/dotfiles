#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="nvim"

alias reload="source ~/.bashrc"
alias ec='nvim ~/.bashrc'
alias package-list='paru -Qqe > ~/.pkglist.paru.txt &'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias package-prune='paru -Rns $(pacman -Qdtq)'

# ANSI color codes WITH bracket escapes for PS1:
COLOR_WHITE="\[\033[38;5;250m\]"
COLOR_BLUE="\[\033[38;5;75m\]"
COLOR_RESET="\[\033[0m\]"
TIME_COLOR="\[\033[38;5;244m\]"

# Git branch function
git_branch() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  echo -n " $branch"
}

# Build single-line prompt
build_prompt_line() {
  # Left: user@host + path + (git_branch if any)
  local left="${COLOR_WHITE}\u@\h${COLOR_RESET} ${COLOR_BLUE}\w${COLOR_RESET}"
  local branch=$(git_branch)
  if [ -n "$branch" ]; then
    left="$left $branch"
  fi

  # Right: the current time [HH:MM:SS]
  local right="${TIME_COLOR}[$(date +'%H:%M:%S')]${COLOR_RESET}"

  # Remove bracketed escapes for length calculation
  local left_stripped=$(echo -e "$left" | sed 's/\x1B\[[0-9;]*m//g')
  local right_stripped=$(echo -e "$right" | sed 's/\x1B\[[0-9;]*m//g')

  # Terminal width
  local columns=$(tput cols)

  local left_len=${#left_stripped}
  local right_len=${#right_stripped}
  local spaces=$(( columns - left_len - right_len ))
  [ $spaces -lt 1 ] && spaces=1  # ensure minimal spacing

  # Return combined line: left + spaces + right
  echo -e "${left}$(printf '%*s' $spaces)${right}"
}

# PROMPT_COMMAND calls the single-line builder just before the PS1 prompt
PROMPT_COMMAND='PS1="$(build_prompt_line)\n\$ "'

# Enable or disable restricted development ports
manage_ports() {
    local flag=$1
    local action="allow"
    if [[ "$flag" == "enable" ]]; then
        echo "Enabling ports..."
    elif [[ "$flag" == "disable" ]]; then
        action="delete allow"
        echo "Disabling ports..."
    else
        echo "Unknown arg"
        return
    fi

    local rules=(
        "from 127.0.0.1 to any port 6379"  # Redis (Localhost only)
        "from 127.0.0.1 to any port 27017" # MongoDB (Localhost only)
        "from 192.168.1.0/24 to any port 8096" # Emby
        "from 192.168.1.0/24 to any port 5432"  # PostgreSQL (Local Network)
        "from 192.168.1.0/24 to any port 5000"  # Flask (Local Network)
        "from 192.168.1.0/24 to any port 8000"  # Django (Local Network)
        "from 192.168.1.0/24 to any port 8080"  # Proxy Servers (Local Network)
        "to any port 80"  # HTTP (Public Access)
        "to any port 443" # HTTPS (Public Access)
        "to any port 3000" # Node.js (Public Access)
        "to any port 9092" # Kafka (Public Access)
        "to any port 3306" # MySQL (Public Access)
        "to any port 6934" # DHT UDP
        "to any port 6926" # BitTorrent
    )
    
    for rule in "${rules[@]}"; do
        eval "sudo ufw $action $rule"
    done

    echo "Ports $flag."
}

alias enableports="manage_ports enable"
alias disableports="manage_ports disable"

tere() {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}
