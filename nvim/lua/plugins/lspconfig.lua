local config = function()
  local lsp_config = require('core.lsp')

  -- Setup mason
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
      "yamlls",
    },
  }

  local lspconfig = require('lspconfig')

  require('mason-lspconfig').setup_handlers {
    function(server_name) -- default handler for all servers
      lspconfig[server_name].setup {
        on_attach = lsp_config.on_attach,
      }
    end,

    -- Skip ts_ls - using typescript-tools.nvim instead
    ["ts_ls"] = function() end,

    -- Custom handler for eslint
    ["eslint"] = function()
      lspconfig.eslint.setup {
        on_attach = function(client, bufnr)
          lsp_config.on_attach(client, bufnr)
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
  src = 'neovim/nvim-lspconfig',
  tag = 'v2.2.0',
  requires = {
    { src = 'williamboman/mason.nvim' },
    { src = 'williamboman/mason-lspconfig.nvim' },
  },
  config = config
}
