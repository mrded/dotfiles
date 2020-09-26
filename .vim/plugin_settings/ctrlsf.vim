if match(&runtimepath, 'ctrlsf') != -1
  " @TODO: map Ctrl+* to <Plug>CtrlSFPrompt

  let g:ctrlsf_search_mode = 'async'
  let g:ctrlsf_position = 'bottom'
  let g:ctrlsf_winsize = '50%'
  let g:ctrlsf_auto_focus = {
        \ "at": "start"
        \ }

  let g:ctrlsf_ignore_dir = [
        \ "node_modules",
        \ "bower_components",
        \ "cache",
        \ "vendor",
        \ "build",
        \ "dist",
        \ "build",
        \ "coverage",
        \ "__snapshots__",
        \ "build-with-tests",
        \ "build-with-tests-jest",
        \ "dist-with-tests",
        \ "public",
        \ ]
endif
