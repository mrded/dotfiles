return function(use)
  use {
    "diepm/vim-rest-console",
    tag = 'v3.0.2',
    config = function() 
      vim.cmd [[
        let g:vrc_curl_opts = {'-i': ''}
        let g:vrc_show_command = 1

        let g:vrc_set_default_mapping = 0
        :command! Rest :call VrcQuery() 
        autocmd FileType rest nnoremap <buffer> <CR> :call VrcQuery()<CR>
      ]]
    end
  }
end
