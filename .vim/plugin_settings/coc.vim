if match(&runtimepath, 'coc') != -1
  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  set cmdheight=2

  let g:coc_user_config = get(g:, 'coc_user_config', {})

  let g:coc_global_extensions = [
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

  " Use `gw` and `ge` to navigate diagnostics
  nmap <silent> gW <Plug>(coc-diagnostic-prev)
  nmap <silent> gw <Plug>(coc-diagnostic-next)

  nmap <silent> gE <Plug>(coc-diagnostic-prev-error)
  nmap <silent> ge <Plug>(coc-diagnostic-next-error)

  " Select a function
  xmap <silent> if <Plug>(coc-funcobj-i)
  xmap <silent> af <Plug>(coc-funcobj-a)

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
