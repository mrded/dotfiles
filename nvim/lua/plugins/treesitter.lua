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
      'dockerfile',

      'gomod',
      'go',

      'regex',
      'graphql',
      'http',

      'python',
      'ruby',

      -- 'php',
      -- 'phpdoc',

      'make',
      'bash',
      'cpp',
      'cmake',

      'html',
      'css',
      'scss',
      'vue',

      'vim',
      'lua',

      'json',
      'json5',
      'yaml',
      'markdown',

      'javascript',
      'typescript',
      'jsdoc',

      'todotxt'
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

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
end

return function(use)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = config
  }
end
