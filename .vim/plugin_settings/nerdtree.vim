if match(&runtimepath, 'nerdtree') != -1
  nnoremap <C-n> :call NERDTreeToggleInCurDir()<cr>

  " Hide files/folders
  " let NERDTreeIgnore = ['^node_modules$[[dir]]', '^build$[[dir]]']
  let NERDTreeMarkBookmarks = 1
  let NERDTreeShowHidden = 1
  let NERDTreeShowLineNumbers = 0
  let NERDTreeStatusline = 0
  let NERDTreeMinimalUI = 1
  let NERDTreeAutoDeleteBuffer = 1

  function! NERDTreeToggleInCurDir()
    " If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
      exe ":NERDTreeClose"
    else
      exe ":NERDTreeFind"
    endif
  endfunction
endif
