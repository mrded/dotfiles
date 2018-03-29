" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox'

" The fancy start screen
Plug 'mhinz/vim-startify'

" A tree explorer.
Plug 'scrooloose/nerdtree'

" Find and open a file by name
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Find text in files
Plug 'dyng/ctrlsf.vim'

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Syntax checking hacks
Plug 'scrooloose/syntastic'

" Autocomplite
Plug 'Valloric/YouCompleteMe', {'do': './install.py --js-completer' }

" Commenting
Plug 'tpope/vim-commentary'

" Sugar for the UNIX shell commands
Plug 'tpope/vim-eunuch'

" Status bar
Plug 'itchyny/lightline.vim'

" Highlights words under the cursor: http://www.vim.org/scripts/script.php?script_id=4306
Plug 'ihacklog/HiCursorWords'

" Allows toggling bookmarks per line
Plug 'MattesGroeger/vim-bookmarks'

" Plug 'joonty/vdebug'

" interactive scratchpad for hackers. 
Plug 'metakirby5/codi.vim'

" Highlight git changes
Plug 'airblade/vim-gitgutter'

" Git intergation
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()
