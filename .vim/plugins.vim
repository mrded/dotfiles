" I use vim-plug for pluggins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme (colourscheme)
Plug 'morhetz/gruvbox'

" Display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" A tree explorer.
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'

" Find and open a file by name
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Find text in files
Plug 'dyng/ctrlsf.vim', {'do': 'brew install ack'}

" A solid language pack (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Syntax checking hacks
Plug 'scrooloose/syntastic'

" Autocomplite
Plug 'Valloric/YouCompleteMe', {'do': 'brew install cmake; ./install.py --tern-completer' }

" Commenting
Plug 'tpope/vim-commentary'

" Sugar for the UNIX shell commands
Plug 'tpope/vim-eunuch'

" Status bar
Plug 'itchyny/lightline.vim'

" Highlights words under the cursor: http://www.vim.org/scripts/script.php?script_id=4306
Plug 'ihacklog/HiCursorWords'

" Preview colours in source code while editing
Plug 'ap/vim-css-color'

" Debugger
Plug 'joonty/vdebug'

" Highlight git changes
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()
