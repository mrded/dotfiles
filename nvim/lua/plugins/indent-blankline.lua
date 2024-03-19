return {
  "lukas-reineke/indent-blankline.nvim",
  tag = 'v3.5.3',
  config = function()
    require("ibl").setup {
      scope = { enabled = false },
    }
  end
}
