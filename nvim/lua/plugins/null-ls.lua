return function(use)
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')

      -- formatting sources
      local formatting = null_ls.builtins.formatting

      local sources = {
        formatting.prettier,
      }

      null_ls.setup({
        sources = sources,
      })
    end
  }
end
