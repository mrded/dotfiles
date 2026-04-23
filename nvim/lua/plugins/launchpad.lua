-- Highlights words under the cursor
return {
  src = 'mrded/nvim-launchpad',
  config = function()
    require("launchpad").setup({
      projects = {
        { name = "dotfiles", path = "~/dotfiles" },
      },
      auto_open = true,
    })
  end,
}
