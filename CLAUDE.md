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
  - Auto-sync on plugin file changes via BufWritePost autocmd

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

### Configuration Management
- **Export NeoVim config**: `./print_nvim_config.sh | pbcopy`
- **Auto Node.js version switching**: `source ./zsh/nvm-auto-switch.zsh`

## Setup Instructions

### Initial Setup
```bash
git clone https://github.com/mrded/dotfiles.git ~/dotfiles
```

### NeoVim Setup
```bash
brew install neovim
ln -s ~/dotfiles/nvim ~/.config/nvim
nvim +PackerSync +TSUpdate
```

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

# Tmux
brew install tmux
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

## Development Notes

### Plugin System Behavior
- Packer automatically syncs when any file in `lua/plugins/` is saved
- Plugin dependencies (LSP servers) are managed by Mason and should install automatically
- Plugin settings are cached - run `nvim +PackerSync +TSUpdate` after changing configurations

### Current Setup
- Uses Gruvbox theme across all applications
- Monaco font preferred for terminals
- LSP servers and language support managed via Mason
- Contains Claude Code plugin for AI-assisted development