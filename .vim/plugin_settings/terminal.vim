if has('nvim')
  autocmd TermOpen * setlocal nonumber norelativenumber
  :tnoremap <Esc> <C-\><C-n>
endif
