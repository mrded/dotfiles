if match(&runtimepath, 'fzf') != -1
  " search files under opened directory 
  nnoremap <C-p> :Files .<CR>

  " search files under git base directory 
  nnoremap <C-g> :GFiles<CR>
endif

