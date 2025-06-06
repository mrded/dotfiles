-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g     -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'      -- Enable mouse support
-- opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
-- opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.spelllang = 'en_gb'

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true         -- Show line number
opt.showmatch = false     -- Highlight matching parenthesis
opt.foldmethod = 'syntax' -- Enable folding (default 'foldmarker')
opt.splitright = true     -- Vertical split to the right
opt.splitbelow = true     -- Horizontal split to the bottom
opt.ignorecase = false    -- Ignore case letters when search
opt.smartcase = true      -- Ignore lowercase for the whole pattern
opt.linebreak = true      -- Wrap on word boundary
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.laststatus = 3        -- Set global statusline

vim.cmd [[
  set winbar=%=%m\ %f
]] -- Show a file name for every split

vim.cmd [[
  set nofoldenable
]] -- Prevent automatic folding

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 2     -- Shift 4 spaces when tab
opt.tabstop = 2        -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true     -- Enable background buffers
opt.history = 100     -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240   -- Max column for syntax highlight
opt.updatetime = 700  -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

-- Set the tab title
opt.title = true
opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

-- Change leader to a comma
g.mapleader = ','

-- Disable builtins plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
  "python3_provider",
  "perl_provider",
  "ruby_provider"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 0
end

-----------------------------------------------------------
--- Diagnostics
-----------------------------------------------------------
vim.fn.sign_define("DiagnosticSignError", { text = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "" })

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
})
