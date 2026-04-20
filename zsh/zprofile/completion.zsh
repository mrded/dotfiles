zmodload zsh/complist

# Initialize completion system (must run before any compdef calls)
autoload -Uz compinit && compinit -u

# Show a selectable completion menu
zstyle ':completion:*' menu select

# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Nicer completion list
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Optional: make descriptions verbose
zstyle ':completion:*' verbose yes
