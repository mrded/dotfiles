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

packer.reset()
packer.init({
  display = {
    open_fn = require('packer.util').float,
    autoremove = true,
  },
})

local plugins = {
  -- Color schemes
  'gruvbox',

  -- Status bar
  'lualine',
  'bufferline', -- Tabs
  -- 'barbecue',

  -- File explorer
  'nvim-tree',

  -- Full text search
  'ctrlsf',

  -- Fuzzy file finder
  'telescope',
  -- 'zond',
  -- 'aerial', -- Showing functions and methods. Problematic with JS files.

  -- Git integration
  'vgit',    -- Highlight git changes
  'gh-line', -- opens a link to the current line on GitHub

  -- LSP
  'lspconfig',
  -- 'null-ls',
  'mason',
  'mason-lspconfig',
  'lspsaga', -- LSP UI

  -- Autocomplete
  'cmp',
  'copilot',

  -- Syntax highlighting
  'treesitter',

  -- Commenting
  'nvim-comment',

  -- display vertical lines at each indentation level
  'indent-blankline',

  -- fancy scrollbars
  -- 'scrollview', -- not working properly

  -- fancy notifications
  -- 'lsp-notify',

  -- terraform
  'terraform',
}

for _, plugin in ipairs(plugins) do
  local path = ('plugins/%s'):format(plugin)

  local ok, meta = pcall(require, path)

  if ok then
    packer.use(meta)
  end
end

packer.use 'wbthomason/packer.nvim' -- packer can manage itself

-- Highlights words under the cursor
-- TODO: can probably done natively.
packer.use 'RRethy/vim-illuminate'
