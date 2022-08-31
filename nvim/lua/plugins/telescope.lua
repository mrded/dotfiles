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
      vim.cmd [[
        nnoremap <C-p> <cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>
        nnoremap <C-f> <cmd>lua require'telescope.builtin'.live_grep()<cr>
      ]]

      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          }
        }
      }

      require('telescope').load_extension('fzf')
    end
  }
end
