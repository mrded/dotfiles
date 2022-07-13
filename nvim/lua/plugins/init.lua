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

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

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
  use { 'morhetz/gruvbox', tag = 'v3.0.1-rc.0' }

  -- File explorer
  use {
    'scrooloose/nerdtree',
    tag = '6.10.16',
    requires = {
      'Xuyuanp/nerdtree-git-plugin',
    },
  }

  -- Fuzzy file finder
  use {
    'junegunn/fzf',
    tag = '0.27.2',
    run = ':call fzf#install()',
    requires = {
      'junegunn/fzf.vim',
    },
  }

  -- Full text search
  use { 'dyng/ctrlsf.vim', tag = 'v2.1.2' }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    tag = 'v0.1.3',
    -- brew install gopls && npm install -g yaml-language-server typescript typescript-language-server
  }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Syntax highlighting
  use { 'sheerun/vim-polyglot', tag = 'v4.17.0' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Commenting
  use { 'tpope/vim-commentary', tag = 'v1.3' }

  -- Status bar
  use { 'vim-airline/vim-airline', tag = 'v0.11' }

  -- Plug 'mrded/vim-github-codeowners', {'do': 'npm install'}

  -- Highlights words under the cursor
  use 'RRethy/vim-illuminate'

  -- REST client
  use 'diepm/vim-rest-console'

  -- display vertical lines at each indentation level 
  require('plugins/indent-blankline')(use)

  -- Highlight git changes
  use 'airblade/vim-gitgutter'

  -- opens a link to the current line on GitHub
  use 'ruanyl/vim-gh-line'

  -- Git wrapper
  use { 'tpope/vim-fugitive', tag = 'v3.7' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
