# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for various development tools and terminal applications. The repository is organized by application with each tool having its own directory.

## Key Architecture

### NeoVim Configuration Structure

- **Entry Point**: `nvim/init.lua` - loads all core modules
- **Core Modules**: `nvim/lua/core/` - fundamental NeoVim settings and functionality
- **Plugin System**: Uses Packer.nvim with a modular approach
  - `nvim/lua/core/packer.lua` - automatically loads all plugin specs from `lua/plugins/*.lua`
  - Each plugin has its own file in `nvim/lua/plugins/` returning a Packer spec

### Zsh Configuration Structure

- **Entry Point**: `zsh/init.zsh` - loads all zsh modules and configurations
- **Theme**: `zsh/theme.zsh` - robbyrussell theme (vanilla zsh, no oh-my-zsh required)
- **NVM Auto-Switch**: `zsh/nvm-auto-switch.zsh` - automatically switches Node.js versions based on `.nvmrc`

### Terminal Configurations

- **Alacritty**: `alacritty/alacritty.toml`
- **Ghostty**: `ghostty/config` with themes in `ghostty/themes/`
- **Kitty**: `kitty/kitty.conf` and `kitty/theme.conf`
- **Wezterm**: `wezterm/wezterm.lua`
- **Tmux**: `tmux/tmux.conf`

## Common Commands

### NeoVim Plugin Management

- **Install/Update plugins**: `nvim +PackerSync +TSUpdate`
- **Update TreeSitter**: `nvim +TSUpdate`
- **Update remote plugins**: `nvim +UpdateRemotePlugins`

### Adding New NeoVim Plugins

1. Create new file: `nvim/lua/plugins/{plugin-name}.lua`
2. Return Packer spec: `return { 'author/plugin-name' }`
3. Save and run: `nvim +PackerSync +TSUpdate`

### Zsh Configuration

- **Load all zsh configs**: `source ~/dotfiles/zsh/init.zsh` (includes theme and nvm auto-switch)
- **Individual modules**: Can be sourced separately if needed

## Setup Instructions

### Initial Setup

```bash
git clone https://github.com/mrded/dotfiles.git ~/dotfiles
```

### Zsh Setup

```bash
# Add to ~/.zshrc
source ~/dotfiles/zsh/init.zsh

# Reload shell
source ~/.zshrc
```

**Note**: Uses vanilla zsh with robbyrussell theme (no oh-my-zsh required)

### NeoVim Setup

```bash
brew install neovim
brew install tree-sitter-cli  # Required for TreeSitter parser compilation
ln -s ~/dotfiles/nvim ~/.config/nvim
nvim +PackerSync +TSUpdate
```

**Note**: `tree-sitter-cli` is required for compiling TreeSitter parsers in NeoVim 0.12.0+

### Terminal Setup

```bash
# Alacritty
ln -s ~/dotfiles/alacritty ~/.config/alacritty

# Ghostty
ln -s ~/dotfiles/ghostty ~/.config/ghostty

# Kitty
ln -s ~/dotfiles/kitty ~/.config/kitty

# Wezterm
ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua

# Neovide (GUI NeoVim client)
brew install --cask neovide

# Tmux
brew install tmux
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

## Development Notes

### Plugin System Behavior

- Plugin dependencies (LSP servers) are managed by Mason and should install automatically
- Plugin settings are cached - run `nvim +PackerSync +TSUpdate` after changing configurations

### Current Setup

- Uses Gruvbox theme across all applications
- Monaco font preferred for terminals
- LSP servers and language support managed via Mason
- Ghostty is preferred as a terminal
- Contains Claude Code plugin for AI-assisted development
- Uses vanilla zsh with robbyrussell theme (no oh-my-zsh dependency)
