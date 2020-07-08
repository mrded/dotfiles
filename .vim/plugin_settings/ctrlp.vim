if match(&runtimepath, 'ctrlp') != -1
  let ctrlp_follow_symlinks = 0
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_use_caching = 0

  "TODO: Ctrl+s -> open in split
  "TODO: Ctrl+t -> open in tab

  " Note: by default, wildignore and g:ctrlp_custom_ignore only apply when globpath() is used to scan for files
  " thus these options do not apply when a command defined with g:ctrlp_user_command is being used.
  " let g:ctrlp_user_command = 'find %s -type f'
  " if executable('ag')
  "   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " endif

  set wildignore+=*/node_modules/*
  set wildignore+=*/build/*
  set wildignore+=*/cache/*
  set wildignore+=*/vendor/*
  set wildignore+=*/dist/*
  set wildignore+=*/build-with-tests/*

  " Performance optimisation. 
  let g:ctrlp_clear_cache_on_exit = 0
endif
