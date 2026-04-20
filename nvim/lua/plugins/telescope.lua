-- Fuzzy file finder
return {
  src = 'nvim-telescope/telescope.nvim',
  tag = 'v0.2.1',
  install = function()
    -- brew install fd ripgrep
    local missing = {}
    for _, bin in ipairs({ 'fd', 'rg' }) do
      if vim.fn.executable(bin) == 0 then
        table.insert(missing, bin)
      end
    end
    if #missing > 0 then
      vim.notify(
        "telescope: missing system tools: " .. table.concat(missing, ", ") ..
        vim.log.levels.WARN
      )
    end
  end,
  requires = {
    { src = 'nvim-lua/plenary.nvim' },
    { src = 'nvim-telescope/telescope-fzf-native.nvim' },
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
    vim.keymap.set('n', '<C-g>', builtin.git_status, opts)

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

    -- Load fzf extension if available (requires manual build)
    pcall(function()
      require('telescope').load_extension('fzf')
    end)
  end
}
