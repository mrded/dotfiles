if match(&runtimepath, 'lightline') != -1
  set noshowmode " get rid of the extraneous default vim mode information that is now provided by lightline
  set laststatus=2 " make status bar appear not only on :vsp
  " @TODO: Show relative path to the file. https://github.com/itchyny/lightline.vim/issues/87
  " @TODO: Hide useless information from right side.
endif
