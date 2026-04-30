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

- Install Neovim `brew install neovim tree-sitter-cli` (requires NeoVim 0.12.0+)
- Replace configuration: `ln -s ~/dotfiles/nvim ~/.config/nvim`
- Install plugins: `nvim +PackSync +TSUpdate`

**Note**: Uses `vim.pack` APIs (NeoVim 0.12+ built-in) with automatic dependency deduplication. The lockfile at `~/.config/nvim/nvim-pack-lock.json` tracks plugin versions and should be version controlled for consistency across machines.

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
2. Return a plugin spec:
   ```lua
   return {
     src = 'author/plugin-name',   -- required
     tag = 'v1.0.0',               -- optional: pin version
     install = 'make',             -- optional: runs once on first install, in plugin dir
     requires = {                  -- optional: src and tag only
       { src = 'nvim-lua/plenary.nvim' },
     },
     config = function()           -- optional: runs on every startup
       require('plugin-name').setup({})
     end,
   }
   ```
   - If a dependency needs its own `install` hook, give it its own file in `lua/plugins/`
3. Save and sync: `nvim +PackSync` or `:PackSync` inside NeoVim

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

- After changing plugin settings, run `:PackSync` and restart NeoVim
- **Changing versions**: Edit `tag`, delete the plugin dir (`rm -rf ~/.local/share/nvim/site/pack/core/opt/<name>`), then `:PackSync`. For all plugins: `:PackNuke` then `:PackSync`
- **Removing plugins**: Delete the spec file and run `:PackSync` — auto-removes from disk
- **Spec errors**: Syntax errors in plugin files abort the sync (not silently dropped)
- **Local plugins**: Not supported — use git remotes or push to GitHub instead
- **Dependencies**: Automatically deduplicated; pinned specs (`tag`) take precedence over unpinned
- **Unpinned plugins**: Updated on every `:PackSync` (omit `tag` to track latest)
- **Install hooks**: Run once on first install in the plugin directory; failed hooks remove the plugin so `:PackSync` retries
- **LSP servers**: Managed by [Mason](https://github.com/williamboman/mason.nvim) and install automatically
- **Non-interactive**: `nvim +PackSync` and `nvim +PackNuke` skip plugin startup to run cleanly

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

Custom skills and commands for Claude Code are stored in `llm/`.

### Setup

Symlink skills and commands to your Claude configuration:

```bash
ln -s ~/dotfiles/llm/skills ~/.claude/skills
ln -s ~/dotfiles/llm/commands ~/.claude/commands
```

### Available Skills

Skills are automatically activated by Claude Code based on context:

- **codestyle** (`llm/skills/codestyle/`) - Enforces code style guidelines (no `let`, no `any`, AAA test pattern, etc.)
- **development** (`llm/skills/development/`) - Development best practices and patterns

### Available Commands

Commands are invoked manually with slash syntax:

- **/grill-me** - Interview mode for intensive design review, walks through every aspect of a plan
- **/ubiquitous-language** - Scans codebase and creates UBIQUITOUS_LANGUAGE.md with shared terminology

## Tools

- `source ~/dotfiles/zsh/init.zsh` - Load zsh configuration (robbyrussell theme + nvm auto-switch)
- `./scripts/killport.sh <port>` - Kill any process running on the specified port.
