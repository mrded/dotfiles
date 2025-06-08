#!/bin/bash
# This script prints all the Neovim configuration for chatGPT to read.

cd ~/dotfiles/nvim || { echo "Directory not found"; exit 1; }

find . -type f \
  ! -path "./plugin/*" \
  ! -path "./plugin_settings/*" \
  | sort | while read -r file; do
    echo "########################################"
    echo "# File: $file"
    echo "########################################"
    echo
    cat "$file"
    echo -e "\n"
done
