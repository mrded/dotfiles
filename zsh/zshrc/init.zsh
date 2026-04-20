# Zsh initialization file
# Source this file in your .zshrc: source ~/dotfiles/zsh/zshrc/init.zsh
ZSH_DIR="${0:A:h}"

source "$ZSH_DIR/completion.zsh"  # Must load before any compdef usage
source "$ZSH_DIR/theme.zsh"
source "$ZSH_DIR/history.zsh"

