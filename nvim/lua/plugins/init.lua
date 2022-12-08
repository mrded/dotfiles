-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Color schemes
  require('plugins/gruvbox')(use)

  -- File explorer
  -- TODO: replace with kyazdani42/nvim-tree.lua
  -- require('plugins/nerdtree')(use)
  require('plugins/nvim-tree')(use)

  -- Full text search
  -- TODO: replace with nvim-telescope/telescope.nvim
  require('plugins/ctrlsf')(use)

  -- Fuzzy file finder
  require('plugins/telescope')(use)
  require('plugins/zond')(use)

  -- LSP
  require('plugins/lspconfig')(use)
  -- brew install gopls && npm install -g yaml-language-server typescript typescript-language-server

  -- Autocomplete
  require('plugins/cmp')(use)

  -- AI autocomplite
  use {
    'github/copilot.vim',
    -- you need to run ':Copilot setup' manually
  }

  -- Syntax highlighting
  require('plugins/treesitter')(use)

  require('plugins/null-ls')(use)

  -- Commenting
  -- TODO: can probably done natively with LSP.
  require('plugins/commentary')(use)

  -- Status bar
  require('plugins/airline')(use)

  -- Plug 'mrded/vim-github-codeowners', {'do': 'npm install'}

  -- Highlights words under the cursor
  -- TODO: can probably done natively.
  use 'RRethy/vim-illuminate'

  -- REST client
  require('plugins/vim-rest-console')(use)

  -- display vertical lines at each indentation level
  require('plugins/indent-blankline')(use)

  -- Highlight git changes
  use 'airblade/vim-gitgutter'

  -- opens a link to the current line on GitHub
  require('plugins/gh-line')(use)

  -- Git wrapper
  use { 'tpope/vim-fugitive', tag = 'v3.7' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
