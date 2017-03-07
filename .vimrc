" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox'
syntax on
colorscheme gruvbox
set background=dark

" A tree explorer.
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Syntax checking hacks
Plug 'scrooloose/syntastic'

" Autocomplite
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --gocode-completer --tern-completer' }

" Commenting
Plug 'tpope/vim-commentary'

" Status bar
Plug 'itchyny/lightline.vim'
set noshowmode
" @TODO: Show relative path to the file. https://github.com/itchyny/lightline.vim/issues/87
" @TODO: Hide useless information from right side.

" Highlights words under the cursor: http://www.vim.org/scripts/script.php?script_id=4306
Plug 'ihacklog/HiCursorWords'

" Preview colours in source code while editing
Plug 'ap/vim-css-color'

" Initialize plugin system
call plug#end()

" Don't try to be vi compatible
set nocompatible

" Fix problem with backspace
set backspace=2

" show line numbers
set number
set numberwidth=2

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Split screen
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
