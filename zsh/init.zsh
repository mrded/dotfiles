# Zsh initialization file
# Source this file in your .zshrc: source ~/dotfiles/zsh/init.zsh

# Get the directory where this script is located
ZSH_DIR="${0:A:h}"

# Load theme
source "$ZSH_DIR/theme.zsh"

# Load nvm auto-switch
source "$ZSH_DIR/nvm-auto-switch.zsh"
