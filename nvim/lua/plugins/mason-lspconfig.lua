return {
  'williamboman/mason-lspconfig.nvim',
  tag = 'v1.31.0',
  depends = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require("mason-lspconfig").setup({
      automatic_installation = true,
    })
  end,
}
