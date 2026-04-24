return {
  src = 'nvimdev/dashboard-nvim',
  requires = {
    { src = 'Amansingh-afk/milli.nvim' },
  },
  config = function()
    -- Get available splash animations from milli
    local splashes = require("milli").list()
    local random_splash = splashes[math.random(#splashes)]

    local splash = require("milli").load({ splash = random_splash })

    -- Helper function to open a project
    local function open_project(path)
      return function()
        local expanded_path = vim.fn.expand(path)
        if vim.fn.isdirectory(expanded_path) == 0 then
          vim.notify("Invalid directory: " .. path, vim.log.levels.ERROR)
          return
        end
        vim.cmd("bwipeout!")
        vim.fn.chdir(expanded_path)
        vim.cmd("edit .")
      end
    end

    require("dashboard").setup({
      theme = "doom",
      config = {
        header = splash.frames[1],
        center = {
          { icon = "  ", desc = "service-kit",     key = "1", action = open_project("~/Projects/service-kit") },
          { icon = "  ", desc = "lib-service-kit", key = "2", action = open_project("~/Projects/lib-service-kit") },
          { icon = "  ", desc = "core-business",   key = "3", action = open_project("~/Projects/core-business") },
          { icon = "  ", desc = "core-vetting",    key = "4", action = open_project("~/Projects/core-vetting") },
          { icon = "  ", desc = "core-audit",      key = "5", action = open_project("~/Projects/core-audit") },
          { icon = "  ", desc = "core-trade",      key = "6", action = open_project("~/Projects/core-trade") },
          { icon = "  ", desc = "dotfiles",        key = "7", action = open_project("~/dotfiles") },
        },
      },
    })

    -- Enable animated splash with the same random selection
    require("milli").dashboard({ splash = random_splash, loop = true })
  end,
}
