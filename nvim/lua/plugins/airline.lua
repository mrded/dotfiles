return function(use)
  use {
    "vim-airline/vim-airline",
    tag = 'v0.11',
    config = function() 
      vim.cmd [[
        let g:airline_theme='gruvbox'

        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#formatter = 'unique_tail'
        let g:airline#extensions#tabline#show_tab_type = 0
        let g:airline#extensions#tabline#show_close_button = 0
        let g:airline#extensions#tabline#show_tab_nr = 0
        let g:airline#extensions#tabline#show_splits = 0
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline#extensions#tabline#ignore_bufadd_pat = 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'

        let g:airline#extensions#clock#auto = 0

        function! AirlineInit()
          let g:airline_section_a = '' " mode, crypt, paste, spell, iminsert
          let g:airline_section_b = '' " hunks, branch
          " let g:airline_section_c = '' " bufferline or filename, readonly
          " let g:airline_section_x = '' " tagbar, filetype, virtualenv
          let g:airline_section_y = '' " fileencoding, fileformat
          " let g:airline_section_z = '' " percentage, line number, column number

          let g:airline_section_z = airline#section#create(['codeowners'])
          endfunction

          autocmd User AirlineAfterInit call AirlineInit()
        ]]
      end
    }
  end
