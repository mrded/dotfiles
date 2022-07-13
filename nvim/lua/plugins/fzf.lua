return function(use)
  use {
    'junegunn/fzf',
    tag = '0.27.2',
    run = ':call fzf#install()',
    requires = {
      'junegunn/fzf.vim',
    },
    config = function() 
      vim.cmd [[
        nnoremap <C-p> :GFiles<CR>
      ]]
    end
  }
end
