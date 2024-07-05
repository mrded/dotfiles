return {
  'williamboman/mason.nvim',
  tag = 'v1.10.0',
  config = function()
    require('mason').setup()
  end,
}
