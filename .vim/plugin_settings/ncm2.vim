if match(&runtimepath, 'ncm2') != -1
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

  set completeopt=noinsert,menuone,noselect
endif
