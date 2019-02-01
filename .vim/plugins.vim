" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox'

" The fancy start screen
Plug 'mhinz/vim-startify'

" A tree explorer.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Find and open a file by name
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Find text in files
Plug 'dyng/ctrlsf.vim'

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Syntax checking hacks
Plug 'scrooloose/syntastic'

" TypeScript support 
Plug 'Quramy/tsuquyomi'

" CTags
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'

" Autocomplite
" Plug 'Valloric/YouCompleteMe', {'do': './install.py --js-completer' }
" Plug 'ncm2/ncm2'
" Plug 'Shougo/deoplete.nvim'

" Commenting
Plug 'tpope/vim-commentary'

" Sugar for the UNIX shell commands
Plug 'tpope/vim-eunuch'

" Status bar
Plug 'itchyny/lightline.vim'
" @TODO: Alternative to try.
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'


" Provides an easy way to browse the tags of the current file and get an overview of its structure.
" @TODO: To try.
" Plug 'majutsushi/tagbar'

" Templates manager
Plug 'tibabit/vim-templates'

" Highlights words under the cursor: http://www.vim.org/scripts/script.php?script_id=4306
Plug 'mrded/vim-hi-cursor-words'

" Allows toggling bookmarks per line
Plug 'MattesGroeger/vim-bookmarks'

" interactive scratchpad for hackers. 
"Plug 'metakirby5/codi.vim'

" Highlight git changes
Plug 'airblade/vim-gitgutter'

" Git intergation
Plug 'tpope/vim-fugitive'

" Close all buffers except visible 
Plug 'Asheq/close-buffers.vim'

" Initialize plugin system
call plug#end()
