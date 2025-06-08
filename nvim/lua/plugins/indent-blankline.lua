-- display vertical lines at each indentation level
return {
  "lukas-reineke/indent-blankline.nvim",
  tag = 'v3.7.1',
  config = function()
    require("ibl").setup {
      scope = { enabled = false },
    }
  end
}
