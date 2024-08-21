return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  run = 'brew install fd ripgrep',
  requires = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    local builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }

    local function search_in_tests()
      builtin.live_grep({
        glob_pattern = { "*.test.*", "*.spec.*" },
      })
    end

    local function search_in_files()
      builtin.live_grep({
        file_ignore_patterns = { "%.test%..*", "%.spec%..*" },
      })
    end

    vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
    vim.keymap.set('n', '<C-f>', search_in_files, opts)
    vim.keymap.set('n', '<C-t>', search_in_tests, opts)

    require('telescope').setup {
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      },
    }

    require('telescope').load_extension('fzf')
  end
}
