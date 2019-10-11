if match(&runtimepath, 'coc-prettier') != -1
  " Prettier on save
  autocmd BufWritePre *.js,*.ts,*.tsx CocCommand prettier.formatFile
endif
