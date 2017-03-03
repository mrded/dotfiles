" Don't try to be vi compatible
set nocompatible

syntax on

" Fix problem with backspace
set backspace=2

" show line numbers
set number
set numberwidth=2

" colorscheme
colorscheme railscasts

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Autocomplite
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" NERDTree settings bellow:
map <C-n> :NERDTreeToggle<CR>

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" A tree explorer.
Plug 'scrooloose/nerdtree'

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Syntax checking hacks
Plug 'scrooloose/syntastic'

" Autocomplite
" Plug 'ternjs/tern_for_vim', {'do': 'npm i' }
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --gocode-completer --tern-completer' }


" Commenting
Plug 'tpope/vim-commentary'

" Status bar
Plug 'itchyny/lightline.vim'

" Highlights words under the cursor: http://www.vim.org/scripts/script.php?script_id=4306
Plug 'ihacklog/HiCursorWords'

" Initialize plugin system
call plug#end()
