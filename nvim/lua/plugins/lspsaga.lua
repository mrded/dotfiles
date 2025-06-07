return {
  'nvimdev/lspsaga.nvim',
  -- tag = 'v1.0.0',
  config = function()
    require('lspsaga').setup({
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = true,
      },
    })
  end,
}
