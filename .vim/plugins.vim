" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox', { 'tag': 'v3.0.1-rc.0' }

" A tree explorer.
Plug 'scrooloose/nerdtree', { 'tag': '6.10.16' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'tag': '0.27.2', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"
" Find text in files
Plug 'dyng/ctrlsf.vim', { 'tag': 'v2.1.2' }

" LSP (Language Server Protocol)
Plug 'neovim/nvim-lspconfig', { 'tag': 'v0.1.3', 'do': 'brew install gopls && npm install -g yaml-language-server typescript typescript-language-server' }

" Autocompletion 
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
Plug 'hrsh7th/vim-vsnip', { 'branch': 'master' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }

" syntax highlighting
Plug 'sheerun/vim-polyglot', { 'tag': 'v4.17.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " :TSInstall all

" Commenting
Plug 'tpope/vim-commentary', { 'tag': 'v1.3' }

" Status bar
Plug 'vim-airline/vim-airline', { 'tag': 'v0.11' }

" Plug 'mrded/vim-github-codeowners', {'do': 'npm install'}

" Highlights words under the cursor
Plug 'RRethy/vim-illuminate'

" REST client
Plug 'diepm/vim-rest-console'

" display vertical lines at each indentation level 
Plug 'Yggdroot/indentLine'

" Highlight git changes
Plug 'airblade/vim-gitgutter'

" opens a link to the current line on GitHub
Plug 'ruanyl/vim-gh-line'

" Git wrapper
Plug 'tpope/vim-fugitive', { 'tag': 'v3.7' }

" Initialize plugin system
call plug#end()
