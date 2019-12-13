if match(&runtimepath, 'vim-clap') != -1
  " search files under opened directory 
  nnoremap <C-p> :Clap files .<CR>

  " search files under git base directory 
  nnoremap <C-g> :Clap files<CR>

  nnoremap <C-f> :Clap grep .<CR>
endif
