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
  'lualine-lsp-progress',
  'bufferline',

  -- File explorer
  'nvim-tree',

  -- Full text search
  'ctrlsf',

  -- Fuzzy file finder
  'telescope',
  'zond',
  'aerial', -- Showing functions and methods

  -- LSP
  'lspconfig',
  'null-ls',
  'mason',
  'mason-lspconfig',

  -- Autocomplete
  'cmp',

  -- Syntax highlighting
  'treesitter',

  -- Commenting
  'commentary', -- can probably done natively with LSP.

  -- Surround text with quotes, brackets, etc.
  'surround',

  -- display vertical lines at each indentation level
  'indent-blankline',

  -- Git integration
  'vgit',    -- Highlight git changes
  'gh-line', -- opens a link to the current line on GitHub

  -- fancy notifications
  -- 'lsp-notify',
}

for _, plugin in ipairs(plugins) do
  local path = ('plugins/%s'):format(plugin)

  local ok, meta = pcall(require, path)

  if ok then
    packer.use(meta)
  end
end

packer.use 'wbthomason/packer.nvim' -- packer can manage itself

-- AI autocomplite
packer.use { 'github/copilot.vim', tag = 'v1.38.0' }
-- you need to run ':Copilot setup' manually

-- Highlights words under the cursor
-- TODO: can probably done natively.
packer.use 'RRethy/vim-illuminate'
