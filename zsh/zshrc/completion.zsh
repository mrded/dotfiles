zmodload zsh/complist

# Show a selectable completion menu
zstyle ':completion:*' menu select

# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Nicer completion list
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Optional: make descriptions verbose
zstyle ':completion:*' verbose yes
