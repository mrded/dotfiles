if match(&runtimepath, 'coc') != -1
  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  set cmdheight=2

  let g:coc_global_extensions = [
      \ 'coc-pairs',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ ]

  " Prettier on save
  autocmd BufWritePre *.js,*.ts,*.tsx CocCommand prettier.formatFile

  " Rename the current word in the cursor
  nmap <leader>cr <Plug>(coc-rename)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Show documentation.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
endif
