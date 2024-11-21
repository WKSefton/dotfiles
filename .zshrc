export PATH=$PATH:$(go env GOPATH)/bin
PROMPT='%F{cyan}%n%f@%F{blue}%m %F{yellow}%~%f $(git_prompt_info) %F{green}\u276f%f '
RPROMPT='%F{magenta}%*%f'

git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'
}

# Custom Prompt
setopt prompt_subst
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f $(git_branch_info) %F{yellow}$%f '

# Function to display Git branch info
git_branch_info() {
  local branch=$(git_branch)
  if [[ -n $branch ]]; then
    echo "%F{magenta}($branch)%f"
  fi
}


# pnpm
export PNPM_HOME="/home/will/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source /usr/share/nvm/init-nvm.sh

# custom functions and aliases
source ~/.zshrc.custom.commands
