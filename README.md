# Dmitry Demenchuk does dotfiles
The single dot that has it all.

Clone the repository into **~/dotfiles**: `git clone https://github.com/mrded/dotfiles.git ~/dotfiles`

## Vim

### Install 
- I use vim 8.0 compiled like following: `brew install vim --override-system-vim --with-cscope --with-lua`
- Replace **~/.vimrc**: `ln -s ~/dotfiles/.vimrc ~/.vimrc`
- Install [vim-plug](https://github.com/junegunn/vim-plug) then run `:PlugInstall`

### NeoVim
- Replace **~/.config/nvim/init.vim**: `ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim`
- Requires Ruby support: `gem install neovim`
- Requires Python (2.6+ or 3.3+) support: `pip2 install --user neovim`

### vim-syntastic/syntastic
- `npm install -g eslint babel-eslint eslint-plugin-react`

### Valloric/YouCompleteMe
- `brew install cmake`

### dyng/ctrlsf.vim
- `brew install ack`

## TODOs
- [X] [Debugging](https://github.com/joonty/vdebug)
- [ ] [Multiple selection / cursors](https://github.com/terryma/vim-multiple-cursors)
