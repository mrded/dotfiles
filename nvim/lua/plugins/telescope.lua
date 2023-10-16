return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  run = 'brew install fd ripgrep',
  requires = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    local builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<c-p>', builtin.find_files, opts)
    vim.keymap.set('n', '<C-f>', builtin.live_grep, opts)

    require('telescope').setup {
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        }
      }
    }

    require('telescope').load_extension('fzf')
  end
}
