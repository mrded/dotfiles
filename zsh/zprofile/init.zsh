# Zsh initialization file
# Source this file in your .zprofile: source ~/dotfiles/zsh/zprofile/init.zsh
ZSH_DIR="${0:A:h}"

source "$ZSH_DIR/brew.zsh"
source "$ZSH_DIR/completion.zsh"  # Load BEFORE nvm (nvm uses compdef)
source "$ZSH_DIR/nvm.zsh"
