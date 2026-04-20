# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for various development tools and terminal applications. The repository is organized by application with each tool having its own directory.

## Key Architecture

### NeoVim Configuration Structure

- **Entry Point**: `nvim/init.lua` - loads all core modules
- **Core Modules**: `nvim/lua/core/` - fundamental NeoVim settings and functionality
- **Plugin System**: Uses vim.pack (NeoVim 0.12+ built-in package manager)
  - `nvim/lua/core/pack.lua` - wrapper around vim.pack APIs
  - Each plugin has its own file in `nvim/lua/plugins/` returning a plugin spec
  - Dependencies via `requires` are deduplicated automatically (pinned specs take precedence)
  - Local plugin paths are not supported — use git remotes instead
  - Plugins installed to `~/.local/share/nvim/site/pack/core/opt/`

### Zsh Configuration Structure

- **Entry Point**: `zsh/init.zsh` - loads all zsh modules and configurations
- **Theme**: `zsh/theme.zsh` - robbyrussell theme (vanilla zsh, no oh-my-zsh required)
- **NVM Auto-Switch**: `zsh/nvm-auto-switch.zsh` - automatically switches Node.js versions based on `.nvmrc`

### Terminal Configurations

- **Ghostty**: `ghostty/config` with themes in `ghostty/themes/`
- **Kitty**: `kitty/kitty.conf` and `kitty/theme.conf`
- **Wezterm**: `wezterm/wezterm.lua`

## Common Commands

### NeoVim Plugin Management

- **Install/update**: `:PackSync` - install missing, update unpinned, remove undeclared (non-interactive)
- **Wipe all plugins**: `:PackNuke` - delete everything, no confirmation
- **Reinstall from scratch**: `:PackNuke` then `:PackSync`, or `:PackReinstall` (prompts)
- **Update TreeSitter**: `nvim +TSUpdate`
- **Update remote plugins**: `nvim +UpdateRemotePlugins`

### Adding New NeoVim Plugins

1. Create new file: `nvim/lua/plugins/{plugin-name}.lua`
2. Return a plugin spec (see format below)
3. Save and run: `:PackSync` inside NeoVim or `nvim +PackSync`

**Spec format**:

| Field | Type | Description |
|-------|------|-------------|
| `src` | `string` | `'author/repo'` or full URL (required) |
| `tag` | `string` | Pin to tag, branch, or SHA (omit for latest) |
| `requires` | `table` | Array of `{ src = '...' }` / `{ src = '...', tag = '...' }` (optional) |
| `install` | `string\|function` | Runs once on first install, in the plugin directory (optional) |
| `config` | `function` | Runs on every startup for installed plugins (optional) |

**Rules**:
- `requires` entries support only `src` and `tag` — no hooks or nesting
- If a dependency needs an `install` hook or its own `requires`, give it its own file in `lua/plugins/`
- Local paths not supported — use a git remote or push to GitHub

**Example:**
```lua
return {
  src = 'nvim-telescope/telescope.nvim',
  tag = 'v0.2.1',
  install = 'brew install fd ripgrep',
  requires = {
    { src = 'nvim-lua/plenary.nvim' },
    { src = 'nvim-telescope/telescope-fzf-native.nvim' },
  },
  config = function()
    require('telescope').setup({})
  end
}
```

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
brew install neovim  # NeoVim 0.12.0+ required for vim.pack
brew install tree-sitter-cli  # Required for TreeSitter parser compilation
ln -s ~/dotfiles/nvim ~/.config/nvim
nvim +PackSync +TSUpdate
```

**Note**: Requires NeoVim 0.12.0+ with `vim.pack` API support

### Terminal Setup

```bash
# Ghostty
ln -s ~/dotfiles/ghostty ~/.config/ghostty

# Kitty
ln -s ~/dotfiles/kitty ~/.config/kitty

# Wezterm
ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua

# Neovide (GUI NeoVim client)
brew install --cask neovide
```

## Development Notes

### Plugin System Behavior

- **Package Manager**: Uses vim.pack APIs (`vim.pack.add()`, `vim.pack.update()`, `vim.pack.del()`)
- **Parallel Installation**: vim.pack downloads plugins in parallel for fast setup
- **Dependency Management**: Dependencies are automatically deduplicated (pinned specs win over unpinned)
- **Auto-remove**: Undeclared plugins are automatically removed during `:PackSync`
- **Auto-update**: Unpinned plugins (no `tag`) are updated on every `:PackSync`
- **LSP Servers**: Managed by Mason and install automatically
- **Local paths**: Not supported — use git remotes instead
- **CLI safety**: `nvim +PackSync` and `nvim +PackNuke` skip plugin startup loading to avoid noise
- **Commands**:
  - `:PackSync` - install missing, update unpinned, remove undeclared, run install hooks
  - `:PackNuke` - delete `~/.local/share/nvim/site/pack/core/` with no confirmation
  - `:PackReinstall` - same as PackNuke + PackSync with a confirmation prompt

- **Version change workflow**:
  1. Edit `tag` in the spec (or remove it to track latest)
  2. For a single plugin: `rm -rf ~/.local/share/nvim/site/pack/core/opt/<plugin>` then `:PackSync`
  3. For all plugins: `:PackNuke` then `:PackSync` (or `:PackReinstall`)

### Current Setup

- Uses Gruvbox theme across all applications
- Monaco font preferred for terminals
- LSP servers and language support managed via Mason
- Ghostty is preferred as a terminal
- Contains Claude Code plugin for AI-assisted development
- Uses vanilla zsh with robbyrussell theme (no oh-my-zsh dependency)
