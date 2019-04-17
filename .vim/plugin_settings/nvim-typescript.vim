if match(&runtimepath, 'nvim-typescript') != -1
  let g:nvim_typescript#javascript_support = 1
  let g:nvim_typescript#type_info_on_hold = 0
endif
