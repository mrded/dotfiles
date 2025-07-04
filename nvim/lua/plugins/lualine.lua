-- Status bar
return {
  "nvim-lualine/lualine.nvim",
  depends = {
    'arkav/lualine-lsp-progress',
  },
  config = function()
    require('lualine').setup {
      globalstatus = true,
      options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = { '', '' },
        section_separators = { '', '' },
      },

      sections = {
        lualine_a = {},
        lualine_b = { 'branch' },
        lualine_c = { 'lsp_progress' },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
      },

      -- winbar is not working at neovide, using barbecue plugin instead
      -- see: https://github.com/neovide/neovide/issues/2406
      -- winbar = {
      --   lualine_a = { { 'filename', path = 1 } },
      --   lualine_b = {},
      --   lualine_y = { 'diff', 'diagnostics' },
      -- },
      --
      -- inactive_winbar = {
      --   lualine_c = { { 'filename', path = 1 } },
      --   lualine_x = { 'diff', 'diagnostics' },
      -- }
    }
  end
}
