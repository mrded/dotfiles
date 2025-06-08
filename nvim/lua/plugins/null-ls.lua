-- This plugin is used just to use prettier.
-- TODO: find outher way to use prettier and remove null-ls
-- NOTE: null-ls is no longer supported, migrated to none-ls
-- use https://github.com/stevearc/conform.nvim
return {
  'nvimtools/none-ls.nvim',
  ft = { "javascript", "typescript", "css", "json", "yaml", "markdown" }, -- Add other file types handled by Prettier
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
