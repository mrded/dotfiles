" Don't try to be vi compatible
set nocompatible

syntax on

" show line numbers
set number
set numberwidth=2

" colorscheme
colorscheme railscasts

" Tab settings"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

" Initialize plugin system
call plug#end()
