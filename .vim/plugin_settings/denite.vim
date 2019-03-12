if match(&runtimepath, 'denite') != -1
  call denite#custom#option('default', {
        \ 'prompt': '❯'
        \ })

  nnoremap <C-p> :<C-u>Denite file_rec<CR>
endif
