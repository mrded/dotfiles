return {
  src = 'nvim-treesitter/nvim-treesitter-context',
  tag = 'v1.0.0',
  requires = {
    { src = 'nvim-treesitter/nvim-treesitter' },
  },
  config = function()
    require('treesitter-context').setup({
      enable = false,
    })
  end,
}
