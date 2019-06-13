if match(&runtimepath, 'multiple-cursors') != -1
  let g:multi_cursor_use_default_mapping = 0

  " Default mapping
  let g:multi_cursor_start_word_key      = '<C-d>'
  let g:multi_cursor_select_all_word_key = '<A-d>'
  let g:multi_cursor_start_key           = 'g<C-d>'
  let g:multi_cursor_select_all_key      = 'g<A-d>'
  let g:multi_cursor_next_key            = '<C-d>'
  let g:multi_cursor_prev_key            = '<C-p>'
  let g:multi_cursor_skip_key            = '<C-x>'
  let g:multi_cursor_quit_key            = '<Esc>'
endif
