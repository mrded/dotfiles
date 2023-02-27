return {
  "akinsho/bufferline.nvim",
  tag = 'v3.3.0',
  config = function()
    vim.opt.termguicolors = true

    require("bufferline").setup {
      options = {
        mode = "tabs",

        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_buffer_default_icon = false,
        show_close_icon = false,

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count) return "(" .. count .. ")" end,
      }
    }
  end
}
