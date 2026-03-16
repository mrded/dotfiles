# Robbyrussell theme for vanilla zsh (no oh-my-zsh required)
# Source this file in your .zshrc: source ~/dotfiles/zsh/theme.zsh

# Enable prompt substitution
setopt prompt_subst

# Git info function
git_prompt_info() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

  local dirty
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    dirty=" %{$fg[yellow]%}✗%{$reset_color%}"
  fi

  echo " %{$fg[blue]%}git:(%{$fg[red]%}$branch%{$fg[blue]%})$dirty%{$reset_color%}"
}

# Load colors
autoload -U colors && colors

# Set the prompt
PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}$(git_prompt_info) '
