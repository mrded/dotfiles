# Dmitry Demenchuk does dotfiles

The single dot that has it all.

Clone the repository into **~/dotfiles**: `git clone https://github.com/mrded/dotfiles.git ~/dotfiles`


## IntelliJ IDEA Vim. 

`ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc`

## NeoVim
- Install [Neovim v0.7.x](https://github.com/neovim/neovim/releases/latest).
- Replace configuration: `ln -s ~/dotfiles/nvim ~/.config/nvim`
- Install pluggins then run `nvim +PackerSync`

## Troubleshooting

neovim sometimes may not install pluggins propperly. Try to run following:

    :UpdateRemotePlugins 


## dyng/ctrlsf.vim

- `brew install ack`
