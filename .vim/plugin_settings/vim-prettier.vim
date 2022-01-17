" if match(&runtimepath, 'vim-prettier') != -1
  autocmd BufWritePre *.js,*.ts,*.tsx :Prettier 
" endif
