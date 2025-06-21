return {
  'nvim-treesitter/nvim-treesitter-context',
  tag = 'v1.0.0',
  depends = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('treesitter-context').setup({
      enable = true,
    })
  end,
}
