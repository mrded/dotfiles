-- Color schemes
return {
  "ellisonleao/gruvbox.nvim",
  tag = "2.0.0",
  config = function()
    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
    vim.cmd [[set cursorline]]
  end
}
