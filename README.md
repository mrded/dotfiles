# Dmitry Demenchuk does dotfiles

The single dot that has it all.

Clone the repository into **~/dotfiles**: `git clone https://github.com/mrded/dotfiles.git ~/dotfiles`

## NeoVim
- Install Neovim `brew install neovim`
- Replace configuration: `ln -s ~/dotfiles/nvim ~/.config/nvim`
- Install [Packer](https://github.com/wbthomason/packer.nvim) for plugins
- Install plugins: `nvim +PackerSync +TSUpdate`

## How to add a new plugin
1. Create a new file `nvim/lua/plugins/{plugin-name}.lua`
2. The file should return [Packer](https://github.com/wbthomason/packer.nvim) formatted string or a table, with a path to the plugin. eg: `return { 'mrded/{plugin-name}' }` 
3. Include the file name at `nvim/lua/plugins/init.lua`, plugins table.
4. Save and update Packer, to apply changes: `nvim +PackerSync +TSUpdate`

## Gotchas
- When changing plugin's settings, you need to run `nvim +PackerSync +TSUpdate`, as settings are cached.
- Plugin dependencies (eg language servers) should install automagically by [Mason](https://github.com/williamboman/mason.nvim), if not - troubleshoot that direction.

## Troubleshooting

### nvim
neovim may not install plugins propperly. Try to running `:UpdateRemotePlugins`

### treesitter
treesitter may give errors. Try running `:TSUpdate` to update languages.
