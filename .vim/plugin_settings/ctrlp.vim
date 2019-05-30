if match(&runtimepath, 'ctrlp') != -1
  let ctrlp_follow_symlinks = 0

  set wildignore+=*/node_modules/*
  set wildignore+=*/build/*
  set wildignore+=*/cache/*
  set wildignore+=*/vendor/*
  set wildignore+=*/lib/*
endif
