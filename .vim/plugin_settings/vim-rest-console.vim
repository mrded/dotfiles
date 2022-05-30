if match(&runtimepath, 'vim-rest-console') != -1
  let g:vrc_curl_opts = {'-i': ''}
  let g:vrc_show_command = 1

  let g:vrc_set_default_mapping = 0
  :command! Rest :call VrcQuery() 
  autocmd FileType rest nnoremap <buffer> <CR> :call VrcQuery()<CR>
endif
