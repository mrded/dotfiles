# Dmitry Demenchuk does dotfiles

The single dot that has it all.

Clone the repository into **~/dotfiles**: `git clone https://github.com/mrded/dotfiles.git ~/dotfiles`


## IntelliJ IDEA Vim. 

`ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc`

## Vim

### Install

- I use vim 8.0 compiled like following: `brew install vim --override-system-vim --with-cscope --with-lua`
- Replace **~/.vimrc**: `ln -s ~/dotfiles/.vimrc ~/.vimrc`
- Install [vim-plug](https://github.com/junegunn/vim-plug) then run `:PlugInstall`

### NeoVim

- Replace **~/.config/nvim/init.vim**: `ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim`
- Replace **~/.config/nvim/coc-settings.json**: `ln -s .vim/coc-settings.json ~/.config/nvim/coc-settings.json`
- Requires Ruby support: `gem install neovim`
- Requires Python (2.6+ or 3.3+) support: `pip2 install --user neovim`
- After installing you may have to run `:UpdateRemotePlugins`

### Troubleshooting

neovim sometimes may not install pluggins propperly. Try to run following:

    :UpdateRemotePlugins 


### dyng/ctrlsf.vim

- `brew install ack`
