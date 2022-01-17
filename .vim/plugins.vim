" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox', { 'tag': 'v3.0.1-rc.0' }

" A tree explorer.
Plug 'scrooloose/nerdtree', { 'tag': '6.10.11' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'tag': '0.27.2', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"
" Plug 'liuchengxu/vim-clap', { 'tag': 'v0.21', 'do': ':Clap install-binary!' }
" Plug 'liuchengxu/vista.vim'

" Find text in files
Plug 'dyng/ctrlsf.vim', { 'tag': 'v2.1.2' }

" Multiple cursors
" Plug 'terryma/vim-multiple-cursors'

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot', { 'tag': 'v4.17.0' }

Plug 'mustache/vim-mustache-handlebars'


" Commenting
Plug 'tpope/vim-commentary', { 'tag': 'v1.3' }

" Adds quotes and brackeds around a selected block of text
" Plug 'mrded/vim-wrapper'

" Status bar
Plug 'vim-airline/vim-airline', { 'tag': 'v0.11' }

" Plug 'mrded/vim-github-codeowners', {'do': 'npm install'}

" Highlights words under the cursor
Plug 'RRethy/vim-illuminate'

" display vertical lines at each indentation level 
Plug 'Yggdroot/indentLine'

" Highlight git changes
Plug 'airblade/vim-gitgutter'

" opens a link to the current line on GitHub
Plug 'ruanyl/vim-gh-line'

" Git wrapper
Plug 'tpope/vim-fugitive', { 'tag': 'v3.4' }

" Mark highlighting
" Plug 'inkarkat/vim-mark', { 'tag': '3.1.1' }

" Initialize plugin system
call plug#end()
