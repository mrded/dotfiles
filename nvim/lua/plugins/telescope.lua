return function(use)
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function() 
      vim.cmd [[
        nnoremap <C-p> :Telescope git_files<CR>
      ]]
    end
  }
end
