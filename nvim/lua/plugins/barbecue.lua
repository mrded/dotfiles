return {
  'utilyre/barbecue.nvim',
  tag = 'v1.2.0',
  requires = {
    "SmiteshP/nvim-navic",
  },
  config = function()
    require("barbecue").setup()
  end
}
