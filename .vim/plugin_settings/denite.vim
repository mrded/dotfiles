if match(&runtimepath, 'denite') != -1
  call denite#custom#option('default', { 'prompt': '❯' })

  call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
  call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')

  " nnoremap <C-p> :<C-u>Denite file_rec<CR>
  nnoremap <C-p> :<C-u>Denite -source-names=hide buffer file_rec<CR>
endif
