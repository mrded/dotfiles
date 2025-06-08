local config = function()
  local lspconfig = require('lspconfig')

  local common_on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
    -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'D', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', 'gE', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  end

  lspconfig.eslint.setup {
    -- flags = { debounce_text_changes = 150 },
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)

      -- client.resolved_capabilities.document_formatting = true
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  }

  lspconfig.ts_ls.setup {
    on_attach = common_on_attach,
  }

  lspconfig.yamlls.setup {
    on_attach = common_on_attach,
  }

  lspconfig.lua_ls.setup {
    on_attach = common_on_attach,
  }

  lspconfig.terraformls.setup {
    on_attach = common_on_attach,
  }

  lspconfig.tflint.setup {
    on_attach = common_on_attach,
  }
end

return {
  'neovim/nvim-lspconfig',
  tag = 'v2.2.0',
  config = config
}
