if match(&runtimepath, 'fzf') != -1
  " If git avaliable - use :GFiles otherwise :Files
  fun! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
      :Files
    else
      :GFiles
    endif
  endfun

  nnoremap <c-p> :call FzfOmniFiles()<cr>

  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-i': 'split',
        \ 'ctrl-s': 'vsplit'
        \ }
endif
