local config = function()
  -- Step 1: Setup mason
  require('mason').setup()
  require('mason-lspconfig').setup {
    automatic_installation = true,
    ensure_installed = {
      "eslint",
      "graphql",
      "lua_ls",
      "luau_lsp",
      "tailwindcss",
      "terraformls",
      "tflint",
      "ts_ls",
      "yamlls",
    },
  }

  -- Step 1.5: Auto-install unsupported servers
  vim.defer_fn(function()
    local registry = require('mason-registry')
    if registry.is_installed('sonarlint-language-server') then
      print("SonarLint already installed")
    else
      print("Installing SonarLint...")
      registry.get_package('sonarlint-language-server'):install()
      print("SonarLint installation complete")
    end
  end, 4000)

  local lspconfig = require('lspconfig')

  -- Step 2: Shared on_attach
  local common_on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Mappings with buffer-local keymaps
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'D', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<CR>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'gE', vim.diagnostic.goto_prev, opts)
  end

  require('mason-lspconfig').setup_handlers {
    function(server_name) -- default handler for all servers
      lspconfig[server_name].setup {
        on_attach = common_on_attach,
      }
    end,

    -- Custom handler for eslint
    ["eslint"] = function()
      lspconfig.eslint.setup {
        on_attach = function(client, bufnr)
          common_on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      }
    end,
  }
end

return {
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  tag = 'v2.2.0',
  config = config
}
