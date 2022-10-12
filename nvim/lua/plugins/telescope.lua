run_test_picker = function()
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  local theme_opts = require('telescope.themes').get_dropdown({
      prompt_title = 'Run a test',
      previewer = false 
    })
  local opts = { 
    search_file = ".spec.ts$",
    attach_mappings = function (prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd([[vsplit term://npx jest ]]..selection[1])
      end)
      return true
    end
  }

  local combined_opts = vim.tbl_extend("force", theme_opts, opts)

  require('telescope.builtin').find_files(combined_opts)
end

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
      local opts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('n', '<C-t>', "<cmd>lua run_test_picker()<CR>", opts)
      vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
      vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)

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
