if match(&runtimepath, 'coc-prettier') != -1
  " Prettier on save
  " augroup cocPrettierGroup
  "   autocmd!
  "   autocmd BufWritePre *.js,*.ts,*.tsx,*.vue CocCommand prettier.formatFile
  " augroup END
endif
