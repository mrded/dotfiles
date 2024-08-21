return {
  'stevearc/aerial.nvim',
  config = function()
    require('aerial').setup({
      backends = { "lsp" },
    })

    local telescope = require('telescope')
    local themes = require('telescope.themes')

    telescope.load_extension('aerial')

    local function show_aerial()
      telescope.extensions.aerial.aerial(themes.get_dropdown({ previewer = false }))
    end

    vim.keymap.set('n', '<C-s>', show_aerial, { noremap = true, silent = true })
  end
}
