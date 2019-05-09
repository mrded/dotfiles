if match(&runtimepath, 'deoplete') != -1
  let g:deoplete#enable_at_startup = 1

  call deoplete#custom#option('smart_case', v:true)

  " Close preview window after completion
  " @see: https://github.com/Shougo/deoplete.nvim/issues/115
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
endif
