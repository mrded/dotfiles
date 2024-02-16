local wezterm = require 'wezterm'

local gruvbox_theme = {
  foreground = "#D4BE98",
  background = "#1D2021",
  cursor_bg = "#D4BE98",
  cursor_border = "#D4BE98",
  cursor_fg = "#1D2021",
  selection_bg = "#D4BE98",
  selection_fg = "#3C3836",

  ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
  brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
}

return {
  font = wezterm.font { family = 'Monaco' },
  freetype_load_flags = "NO_BITMAP",
  font_size = 12.0,
  color_scheme = "gruvbox",
  color_schemes = {
    ["gruvbox"] = gruvbox_theme,
  },
}
