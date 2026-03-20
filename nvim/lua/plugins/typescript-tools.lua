-- TypeScript/JavaScript LSP (faster alternative to ts_ls)
return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    local lsp_config = require('core.lsp')
    require('typescript-tools').setup({
      on_attach = lsp_config.on_attach,
    })
  end,
}
