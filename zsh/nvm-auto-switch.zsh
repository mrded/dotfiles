# This will automatically call nvm use whenever you change into a folder with an .nvmrc file. 
# usage: source this file in your .zshrc or similar.

autoload -U add-zsh-hook

find_up() {
  local path="$PWD"
  while [[ "$path" != "/" ]]; do
    if [[ -f "$path/.nvmrc" ]]; then
      echo "$path/.nvmrc"
      return
    fi
    path=${path:h}
  done
}

load-nvmrc() {
  local nvmrc_path=$(find_up)
  if [[ -n "$nvmrc_path" ]]; then
    local required_version=$(nvm version "$(cat "$nvmrc_path")")
    local current_version=$(nvm current)
    if [[ "$required_version" == "N/A" ]]; then
      nvm install
    elif [[ "$required_version" != "$current_version" ]]; then
      nvm use
    fi
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
