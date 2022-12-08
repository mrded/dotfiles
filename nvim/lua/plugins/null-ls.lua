return function(use)
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')

      -- code action sources
      local code_actions = null_ls.builtins.code_actions

      -- diagnostic sources
      local diagnostics = null_ls.builtins.diagnostics

      -- formatting sources
      local formatting = null_ls.builtins.formatting

      -- hover sources
      local hover = null_ls.builtins.hover

      -- completion sources
      local completion = null_ls.builtins.completion

      local sources = {
        -- formatting.eslint,
        formatting.prettier,
        formatting.stylua,
      }

      null_ls.setup({
        sources = sources,
      })
    end
  }
end
