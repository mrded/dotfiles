if match(&runtimepath, 'ctrlp') != -1
  let g:ctrlp_working_path_mode = 'c'
  let ctrlp_follow_symlinks = 0

  set wildignore+=*/node_modules/*
  set wildignore+=*/build/*
  set wildignore+=*/cache/*
  set wildignore+=*/vendor/*
endif
