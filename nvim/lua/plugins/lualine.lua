return {
  "nvim-lualine/lualine.nvim",
  -- tag = 'v0.11',
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = false,
        theme = 'gruvbox',

        component_separators = { '', '' },
        section_separators = { '', '' },
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {},
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
      },

      winbar = {
        lualine_a = {
          { 'filename', path = 1 }
        },
        lualine_b = {},
        -- lualine_c = {},
        -- lualine_x = {},
        lualine_y = { 'diagnostics' },
        -- lualine_z = {}
      },

      inactive_winbar = {
        -- lualine_a = {},
        -- lualine_b = {},
        lualine_c = {
          { 'filename', path = 1 }
        },
        lualine_x = { 'diagnostics' },
        -- lualine_y = {},
        -- lualine_z = {}
      }
    }
  end
}
