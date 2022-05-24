if match(&runtimepath, 'neoformat') != -1
  autocmd BufWritePre *.go :Neoformat 
endif
