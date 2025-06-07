local config = function()
  local cmp_status_ok, cmp = pcall(require, 'cmp')
  if not cmp_status_ok then
    return
  end

  local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
  if not luasnip_status_ok then
    return
  end

  cmp.setup {
    -- Load snippet support
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    -- Completion settings
    completion = {
      -- completeopt = 'menu,menuone,noselect',
      -- keyword_length = 2
    },

    -- Key mapping
    mapping = {
      ['<Down>'] = cmp.mapping.select_next_item(),
      ['<Up>'] = cmp.mapping.select_prev_item(),
      ['<C-Down>'] = cmp.mapping.scroll_docs(-4),
      ['<C-Up>'] = cmp.mapping.scroll_docs(4),
      -- ['<C-m>'] = cmp.mapping.complete(),
      -- ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },

    },

    -- Load sources, see: https://github.com/topics/nvim-cmp
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
    },
  }
end

return {
  'hrsh7th/nvim-cmp',
  tag = 'v0.0.2',
  requires = {
    { 'L3MON4D3/LuaSnip', tag = 'v2.4.0', run = "make install_jsregexp" },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'saadparwaiz1/cmp_luasnip',
  },
  config = config
}
