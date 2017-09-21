# Dmitry Demenchuk does dotfiles
The single dot that has it all.

Clone the repository into **~/dotfiles**: `git clone https://github.com/mrded/dotfiles.git ~/dotfiles`

## Vim

### Install 
- I use vim 8.0 compiled like following: `brew install vim --override-system-vim --with-cscope --with-lua`
- Replace **~/.vimrc**: `ln -s ~/dotfiles/.vimrc ~/.vimrc`
- Install [vim-plug](https://github.com/junegunn/vim-plug) then run `:PlugInstall`

## NeoVim

### Install 
- Replace **~/.config/nvim/init.vim**: `ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim`
- Install [vim-plug](https://github.com/junegunn/vim-plug) then run `:PlugInstall`

## TODOs
- [X] [Debugging](https://github.com/joonty/vdebug)
- [ ] [Multiple selection / cursors](https://github.com/terryma/vim-multiple-cursors)
