" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox'

" A tree explorer.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy finder
Plug 'kien/ctrlp.vim'

" Find text in files
Plug 'dyng/ctrlsf.vim'

" Multiple cursors
" Plug 'terryma/vim-multiple-cursors'

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Autocomplite
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" Commenting
Plug 'tpope/vim-commentary'

" Adds quotes and brackeds around a selected block of text
Plug 'mrded/vim-wrapper'

" Status bar
Plug 'vim-airline/vim-airline'

" Highlights words under the cursor
Plug 'RRethy/vim-illuminate'

" Highlight git changes
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Highlighte code levels
Plug 'thiagoalessio/rainbow_levels.vim'

" Initialize plugin system
call plug#end()
