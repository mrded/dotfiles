" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox'

" A tree explorer.
Plug 'scrooloose/nerdtree'

" Find and open a file by name
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Syntax checking hacks
Plug scrooloose/syntastic'

" Autocomplite
" Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --gocode-completer --tern-completer' }

" Commenting
Plug 'tpope/vim-commentary'

" Status bar
Plug 'itchyny/lightline.vim'

" Highlights words under the cursor: http://www.vim.org/scripts/script.php?script_id=4306
Plug 'ihacklog/HiCursorWords'

" Preview colours in source code while editing
Plug 'ap/vim-css-color'

" Tasks
Plug 'irrationalistic/vim-tasks'

" Initialize plugin system
call plug#end()
