-- Completion with blink.cmp
return {
  'saghen/blink.cmp',
  version = 'v1.7.0',
  config = function()
    require('blink.cmp').setup({
      keymap = {
        preset = 'default',
        ['<C-n>'] = { 'show' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<C-Down>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-Up>'] = { 'scroll_documentation_up', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      completion = {
        menu = {
          auto_show = false,
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },

      fuzzy = {
        implementation = 'lua',
      },
    })
  end
}
