" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox'

" A tree explorer.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy finder
Plug 'kien/ctrlp.vim'
" Plug 'junegunn/fzf', { 'do': './install --bin' }
" Plug 'junegunn/fzf.vim'

" An asynchronous process manager.
Plug 'Shougo/vimproc.vim'

" Find text in files
Plug 'dyng/ctrlsf.vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" TypeScript support 
Plug 'mhartington/nvim-typescript', {'do': 'npm install -g typescript && ./install.sh'}

" Autocomplite
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-prettier coc-tsserver'}

" Commenting
Plug 'tpope/vim-commentary'

" Adds quotes and brackeds around a selected block of text
Plug 'mrded/vim-wrapper'

" TextMate's snippets features  
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Status bar
Plug 'vim-airline/vim-airline'

" Generates HTML the same way as in PhpStorm.
Plug 'mattn/emmet-vim'

" Highlights words under the cursor: http://www.vim.org/scripts/script.php?script_id=4306
Plug 'mrded/vim-hi-cursor-words'

" Allows toggling bookmarks per line
Plug 'MattesGroeger/vim-bookmarks'

" Highlight git changes
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Close all buffers except visible 
Plug 'Asheq/close-buffers.vim'

" Initialize plugin system
call plug#end()
