if match(&runtimepath, 'nerdtree') != -1
  nnoremap <C-n> :NERDTreeToggle<CR>
  nnoremap <C-m> :NERDTreeFind<CR>

  " Hide files/folders
  " let NERDTreeIgnore = ['^node_modules$[[dir]]', '^build$[[dir]]']
  let NERDTreeMarkBookmarks = 1
  let NERDTreeShowHidden = 1
  let NERDTreeShowLineNumbers = 0
  let NERDTreeStatusline = 0
  let NERDTreeMinimalUI = 1
  let NERDTreeAutoDeleteBuffer = 1
endif
