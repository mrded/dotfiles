return {
  'stevearc/aerial.nvim',
  config = function()
    require('aerial').setup()

    local telescope = require('telescope')
    local themes = require('telescope.themes')

    telescope.load_extension('aerial')

    function show_aerial()
      telescope.extensions.aerial.aerial(themes.get_dropdown({ previewer = false }))
    end

    vim.keymap.set('n', '<C-s>', show_aerial, { noremap = true, silent = true })
  end
}
