-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

local config = function()
  local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
  if not status_ok then
    return
  end

  nvim_treesitter.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {

      -- Part of the core functionality of Neovim.
      'c', 'help', 'lua', 'vim', 'vimdoc', 'query',

      'dockerfile',

      -- 'gomod',
      -- 'go',

      'regex',
      'graphql',
      -- 'http',

      -- 'python',
      -- 'ruby',

      -- 'php',
      -- 'phpdoc',

      'make',
      'bash',
      -- 'cpp',
      'cmake',

      'html',
      'css',
      'scss',
      -- 'vue',

      'json',
      'json5',
      'yaml',
      'markdown',

      'javascript',
      'typescript',
      'jsdoc',

      'hcl',
      -- 'todotxt'
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,

    -- List of parsers to ignore installing
    ignore_install = {},

    incremental_selection = {
      enable = false,
      -- Not sure I need this.
    },

    indent = {
      enable = false
      -- Not sure I need this.
    },

    highlight = {
      enable = true,
      -- list of language that will be disabled
      disable = {},
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }

  -- use the markdown parser for mdx filetypes
  -- @see: https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
  vim.treesitter.language.register('markdown', 'mdx')

  -- Treesitter is trying to highlight a floating window (or closed window) that no longer exists
  vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
      local win = vim.api.nvim_get_current_win()
      local config = vim.api.nvim_win_get_config(win)

      -- If it's a floating window, disable Treesitter highlighting
      if config.relative ~= "" then
        local buf = vim.api.nvim_win_get_buf(win)
        pcall(vim.treesitter.stop, buf)
      end
    end
  })
end

return {
  'nvim-treesitter/nvim-treesitter',
  tag = 'v0.10.0',
  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  config = config
}
