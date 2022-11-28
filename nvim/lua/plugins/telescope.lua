return function(use)
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    run = 'brew install fd ripgrep',
    requires = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
      local builtin = require('telescope.builtin')
      local themes = require('telescope.themes')
      local opts = { noremap = true, silent = true }

      local function find_files()
        local find_files_opts = themes.get_dropdown({ previewer = false })
        find_files_opts["hidden"] = true

        builtin.find_files(find_files_opts)
      end

      vim.keymap.set('n', '<C-p>', find_files, opts)
      vim.keymap.set('n', '<C-f>', builtin.live_grep, opts)

      require('telescope').setup {
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
end
