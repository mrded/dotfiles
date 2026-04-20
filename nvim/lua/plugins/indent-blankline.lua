-- display vertical lines at each indentation level
return {
  src = 'lukas-reineke/indent-blankline.nvim',
  tag = 'v3.9.0',
  config = function()
    require("ibl").setup {
      scope = { enabled = false },
    }
  end
}
