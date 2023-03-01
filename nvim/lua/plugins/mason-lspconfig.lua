return {
  'williamboman/mason-lspconfig.nvim',
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
