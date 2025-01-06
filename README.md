# Dmitry Demenchuk does dotfiles

The single dot that has it all.

Clone the repository into **~/dotfiles**: `git clone https://github.com/mrded/dotfiles.git ~/dotfiles`

## NeoVim
- Install Neovim `brew install neovim`
- Replace configuration: `ln -s ~/dotfiles/nvim ~/.config/nvim`
- Install [Packer](https://github.com/wbthomason/packer.nvim) for plugins
- Install plugins: `nvim +PackerSync +TSUpdate`

## Alacritty
- Install alacritty `brew install --cask alacritty`
- Replace configuration: `ln -s ~/dotfiles/alacritty ~/.config/alacritty`

## Tmux
- Install Tmux `brew install tmux`
- Install [Plugin Manager](https://github.com/tmux-plugins/tpm)
- Install Pluggins: Press prefix + I (capital i, as in Install) 
- Replace configuration: `ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf`

issues:
- [ ] notifications make an icon at the dock jump
- [ ] Prevent from copying to clipboard on mouse select
- [ ] Copy selected text on CMD+C

## Wezterm
Features:
- [ ] font rendering: https://github.com/wez/wezterm/issues/2523
- [ ] opt+key bug: https://github.com/wez/wezterm/discussions/4739
- [ ] strikethrough text support
- [ ] error text highlighting 
- [ ] do not copy on select
- [X] tab support
- [X] configuration in a file

install:
- Replace configuration: `ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua`

## Kitty
- Install: `brew install kitty`
- Replace configuration: `ln -s ~/dotfiles/kitty ~/.config/kitty`

issues:
- the maintainer is a character https://github.com/kovidgoyal/kitty/pull/3544

## Neovide
issues:
- [ ] MacOS tabs https://github.com/neovide/neovide/issues/2378
- [ ] winbar glitches while scrolling https://github.com/neovide/neovide/issues/2406
- [ ] modal borders and lines look broken

## How to add a new NVim plugin
1. Create a new file `nvim/lua/plugins/{plugin-name}.lua`
2. The file should return [Packer](https://github.com/wbthomason/packer.nvim) formatted string or a table, with a path to the plugin. eg: `return { 'mrded/{plugin-name}' }` 
3. Include the file name at `nvim/lua/plugins/init.lua`, plugins table.
4. Save and update Packer, to apply changes: `nvim +PackerSync +TSUpdate`

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

## Gotchas
- When changing plugin's settings, you need to run `nvim +PackerSync +TSUpdate`, as settings are cached.
- Plugin dependencies (eg language servers) should install automagically by [Mason](https://github.com/williamboman/mason.nvim), if not - troubleshoot that direction.

## Troubleshooting

### nvim
neovim may not install plugins propperly. Try to running `:UpdateRemotePlugins`

### treesitter
treesitter may give errors. Try running `:TSUpdate` to update languages.
