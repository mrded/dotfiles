-- Highlights words under the cursor
return {
  src = 'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      -- Delay in milliseconds before highlighting
      delay = 300,
      -- Don't use LSP as a provider to avoid performance issues
      providers = {
        'treesitter',
        'regex',
      },
      -- Large file handling
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { 'treesitter' },
      },
    })
  end,
}
