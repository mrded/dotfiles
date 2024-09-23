local config = function()
  local lspconfig = require('lspconfig')
  --
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    if client.name == "eslint" then
      -- format a document on save:
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'D', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', 'gE', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  end

  local get_handlers = function()
    -- Hover doc popup
    local pop_opts = { border = "rounded", max_width = 80 }

    return {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts),
      ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
      }),
    }
  end

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = {
    'ts_ls',
    -- 'gopls',
    'yamlls',
    'lua_ls',
    'terraformls',
    'eslint',
    -- 'volar',
    -- 'graphql-language-service-cli', try https://www.npmjs.com/package/graphql-language-service-server
    -- 'tailwindcss'
  }

  local common_setup = {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    handlers = get_handlers(),
  }

  for _, lsp in ipairs(servers) do
    if lsp == 'whatever' then
      -- TODO: do custom setup for eslint
      lspconfig[lsp].setup(vim.tbl_extend("force", common_setup, {
        -- TODO: custom setup
      }))
    else
      lspconfig[lsp].setup(common_setup)
    end
  end
end

return {
  'neovim/nvim-lspconfig',
  tag = 'v1.0.0',
  config = config
}
