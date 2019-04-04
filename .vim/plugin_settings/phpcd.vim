if match(&runtimepath, 'phpcd.vim') != -1
  let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
  let g:deoplete#ignore_sources.php = ['omni']
endif
