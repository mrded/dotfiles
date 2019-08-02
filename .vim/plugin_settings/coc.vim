if match(&runtimepath, 'coc') != -1
  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  set cmdheight=2

  " Prettier on save
  autocmd BufWritePre *.js,*.ts,*.tsx CocCommand prettier.formatFile

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
endif
