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
- Requires Ruby support: `gem install neovim`
- Requires Python (2.6+ or 3.3+) support: `pip2 install --user neovim`
- After installing you may have to run `:UpdateRemotePlugins`

### vim-clap pluggin

maple: 
```
brew install rust
:call clap#installer#build_maple()
```

Universal tags with JSON support:
```
brew tap universal-ctags/universal-ctags
brew install --with-jansson --HEAD universal-ctags/universal-ctags/universal-ctags
```

### Troubleshooting

neovim sometimes may not install pluggins propperly. Try to run following:

   :UpdateRemotePlugins 

### vim-syntastic/syntastic || w0rp/ale

- `npm install -g eslint babel-eslint eslint-plugin-react eslint-config-react-app eslint-plugin-import eslint-plugin-flowtype eslint-plugin-jsx-a11y eslint-plugin-react-hooks`

### dyng/ctrlsf.vim

- `brew install ack`
