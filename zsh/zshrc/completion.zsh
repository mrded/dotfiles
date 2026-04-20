# Initialize completion system if not already loaded
if ! command -v compdef &> /dev/null; then
  autoload -Uz compinit && compinit -u
fi
