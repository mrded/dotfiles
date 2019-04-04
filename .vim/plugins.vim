" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox'

" The fancy start screen
Plug 'mhinz/vim-startify'

" A tree explorer.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy finder
" @TODO: use as an alternative to ctrlp + fzf + ctrlsf
Plug 'Shougo/denite.nvim'

" Find text in files
Plug 'dyng/ctrlsf.vim'

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Syntax checking hacks
Plug 'scrooloose/syntastic'

" Formats your code to look pretty 
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" TypeScript support 
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': 'npm install -g typescript && ./install.sh'}

" JavaScript support
" Autocomplite for deoplete
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" PHP support
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install && pecl install msgpack' }

" Autocomplite
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Commenting
Plug 'tpope/vim-commentary'

" Adds quotes and brackeds around a selected block of text
Plug 'mrded/vim-wrapper'


" Status bar
Plug 'itchyny/lightline.vim'
" @TODO: Alternative to try.
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Generates HTML the same way as in PhpStorm.
Plug 'mattn/emmet-vim'

" Highlights words under the cursor: http://www.vim.org/scripts/script.php?script_id=4306
Plug 'mrded/vim-hi-cursor-words'

" Allows toggling bookmarks per line
Plug 'MattesGroeger/vim-bookmarks'

" Highlight git changes
Plug 'airblade/vim-gitgutter'

" Close all buffers except visible 
Plug 'Asheq/close-buffers.vim'

" Initialize plugin system
call plug#end()
