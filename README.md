# Dmitry Demenchuk does dotfiles

The single dot that has it all.

Clone the repository into **~/dotfiles**: `git clone https://github.com/mrded/dotfiles.git ~/dotfiles`


## NeoVim
- Install nighty version of Neovim `brew install neovim --HEAD`
    - `winbar` feature is required 
- Replace configuration: `ln -s ~/dotfiles/nvim ~/.config/nvim`
- Install pluggins then run `nvim +PackerSync +TSUpdate`

## Troubleshooting

Sometimes treesitter may give errors. Try running `:TSUpdate` to update languages 

neovim sometimes may not install pluggins propperly. Try to run following:
```
:UpdateRemotePlugins 
```

Building nighty Neovim may fail because of `libvterm` version https://github.com/neovim/neovim/issues/16217
Try following:
```
brew uninstall --force libvterm
brew unlink libvterm
```


## dyng/ctrlsf.vim

- `brew install ack`
