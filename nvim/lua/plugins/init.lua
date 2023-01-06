-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

local plugins = {
  -- Color schemes
  'plugins/gruvbox',

  -- Status bar
  'plugins/airline',

  -- File explorer
  'plugins/nvim-tree',

  -- Full text search
  'plugins/ctrlsf',

  -- Fuzzy file finder
  'plugins/telescope',
  'plugins/zond',
  'plugins/aerial', -- Showing functions and methods

  -- LSP
  'plugins/lspconfig',
  'plugins/null-ls',
  -- brew install gopls && npm install -g yaml-language-server typescript typescript-language-server

  -- Autocomplete
  'plugins/cmp',

  -- Syntax highlighting
  'plugins/treesitter',

  -- Commenting
  'plugins/commentary', -- can probably done natively with LSP.

  -- display vertical lines at each indentation level
  'plugins/indent-blankline',

  -- Git integration
  'plugins/vgit', -- Highlight git changes
  'plugins/gh-line', -- opens a link to the current line on GitHub
}

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- AI autocomplite
  use {
    'github/copilot.vim',
    -- you need to run ':Copilot setup' manually
  }

  -- Plug 'mrded/vim-github-codeowners', {'do': 'npm install'}

  -- Highlights words under the cursor
  -- TODO: can probably done natively.
  use 'RRethy/vim-illuminate'

  for _, plugin in ipairs(plugins) do
    local meta = require(plugin)
    use(meta)
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end
end)
