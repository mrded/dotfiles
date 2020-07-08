if match(&runtimepath, 'coc-prettier') != -1
  " Prettier on save
  autocmd BufWritePre *.js,*.ts,*.tsx,*.vue CocCommand prettier.formatFile
endif
