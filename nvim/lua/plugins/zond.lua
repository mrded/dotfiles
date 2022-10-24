return function(use)
  use {
    'mrded/nvim-zond',
    -- '~/Projects/nvim-zond',
    tag = '0.0.2',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
    config = function() 
      local opts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('n', '<C-t>', "<cmd>lua require('zond').find_and_run({title = 'Run a test', filter = '.spec.ts$', cmd = 'vsplit term://npx jest --runInBand %s'})<CR>", opts)
    end
  }
end
