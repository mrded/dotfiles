# Dmitry Demenchuk does dotfiles

The single dot that has it all.

Clone the repository into **~/dotfiles**: `git clone https://github.com/mrded/dotfiles.git ~/dotfiles`

## Zsh

Add to your `~/.zshrc`:

```bash
ZSH_DISABLE_COMPFIX=true
source ~/dotfiles/zsh/zshrc/init.zsh
```

Add to your `~/.zprofile`:

```bash
ZSH_DISABLE_COMPFIX=true
source ~/dotfiles/zsh/zprofile/init.zsh
```

## NVM & Node.js

NVM is required for NeoVim plugins (TypeScript tools, Copilot) and is auto-loaded by `zsh/init.zsh`.

1. **Install NVM:**

   ```bash
   brew install nvm
   ```

2. **Install and set default Node.js version (>= v22):**

   ```bash
   nvm install 22
   nvm alias default 22
   ```

3. **Install required global packages:**
   ```bash
   npm install -g typescript neovim
   ```

## NeoVim

- Install Neovim `brew install neovim tree-sitter-cli`
- Replace configuration: `ln -s ~/dotfiles/nvim ~/.config/nvim`
- Install [Packer](https://github.com/wbthomason/packer.nvim) for plugins
- Install plugins: `nvim +PackerSync +TSUpdate`

**Note**: `tree-sitter-cli` is required for compiling TreeSitter parsers in NeoVim 0.12.0+

## Vifm

Replace configuration: `ln -s ~/dotfiles/vifm/vifmrc ~/.config/vifm/vifmrc`

## Alacritty

Replace configuration: `ln -s ~/dotfiles/alacritty ~/.config/alacritty`

issues:

- [ ] osc notification support, to solve a problem with the terminal icon jumping in the dock
  - https://github.com/alacritty/alacritty/issues/7105
  - https://github.com/alacritty/alacritty/issues/406

## Tmux

Tmux is needed for Alacritty to support tabs and splits.

- Install Tmux `brew install tmux`
- Install [Plugin Manager](https://github.com/tmux-plugins/tpm)
- Install Pluggins: `~/.tmux/plugins/tpm/scripts/install_plugins.sh`
- Update Pluggins: `~/.tmux/plugins/tpm/scripts/update_plugin.sh all`
- Cleanup Pluggins: `~/.tmux/plugins/tpm/scripts/clean_plugins.sh`
- Replace configuration: `ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf`

issues:

- [ ] notifications make an icon at the dock jump
- [ ] Prevent from copying to clipboard on mouse select
- [ ] Copy selected text on CMD+C

## Wezterm

Replace configuration: `ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua`

issues:

- [ ] font rendering: https://github.com/wez/wezterm/issues/2523
- [ ] opt+key bug: https://github.com/wez/wezterm/discussions/4739
- [ ] strikethrough text support
- [ ] error text highlighting
- [ ] do not copy on select

## Kitty

Replace configuration: `ln -s ~/dotfiles/kitty ~/.config/kitty`

issues:

- the maintainer is a character https://github.com/kovidgoyal/kitty/pull/3544

## Ghostty

Replace configuration: `ln -s ~/dotfiles/ghostty ~/.config/ghostty`

issues:

- none

## Neovide

Install and link configuration:

```bash
brew install --cask neovide
ln -s ~/dotfiles/neovide ~/.config/neovide
```

Neovide is a GUI client for NeoVim that uses your existing `~/.config/nvim` configuration.

issues:

- [ ] MacOS tabs https://github.com/neovide/neovide/issues/2378
- [x] winbar glitches while scrolling https://github.com/neovide/neovide/issues/2406
- [ ] modal borders and lines look broken

## How to add a new NVim plugin

1. Create a new file `nvim/lua/plugins/{plugin-name}.lua`
2. The file should return [Packer](https://github.com/wbthomason/packer.nvim) formatted string or a table, with a path to the plugin. eg: `return { 'mrded/{plugin-name}' }`
3. Save and update Packer, to apply changes: `nvim +PackerSync +TSUpdate`

## Terminal requirements

- font Monaco support
- font strikethrough support
  - to test: `echo -e "\e[9mstrikethrough\e[0m"`
  - https://www.reddit.com/r/neovim/comments/14ye7a5/how_could_i_enable_strikethrough_render_in_nvim/
- Grovbox theme support
- Tabs and Splits (possibly without xterm)
- iTerm 2 shortcuts
- Config in a file
- Possibility to select text without copying
- Copy on CMD+C

## Gotchas

- When changing plugin's settings, you need to run `nvim +PackerSync +TSUpdate`, as settings are cached.
- Plugin dependencies (eg language servers) should install automagically by [Mason](https://github.com/williamboman/mason.nvim), if not - troubleshoot that direction.

## Troubleshooting

### nvim

neovim may not install plugins propperly. Try to running `:UpdateRemotePlugins`

### treesitter

treesitter may give errors. Try running `:TSUpdate` to update languages.

### SonarLint

SonarLint requires Java 11+

```bash
java -version
```

Add to your `~/.zshrc`:

```bash
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
JAVA_PATH=$JAVA_HOME/bin
```

## Claude Code

Custom skills for Claude Code are stored in `llm/skills/`.

To activate them, symlink to your Claude configuration:

```bash
ln -s ~/dotfiles/llm/skills/codestyle ~/.claude/plugins/local/skills/codestyle
ln -s ~/dotfiles/llm/skills/development ~/.claude/plugins/local/skills/development
ln -s ~/dotfiles/llm/skills ~/.claude/skills
```

### Available Skills

- **codestyle** - Enforces code style guidelines (no `let`, no `any`, AAA test pattern, etc.)
- **development** - Development best practices and patterns

Skills are automatically activated by Claude Code based on context.

## Tools

- `source ~/dotfiles/zsh/init.zsh` - Load zsh configuration (robbyrussell theme + nvm auto-switch)
- `./scripts/killport.sh <port>` - Kill any process running on the specified port.
