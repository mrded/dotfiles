if match(&runtimepath, 'airline') != -1
  let g:airline_theme='gruvbox'

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'

  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#show_close_button = 0

  let g:airline_section_b = ''
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = ''
endif
