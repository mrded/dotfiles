return {
  'elentok/format-on-save.nvim',
  config = function()
    local format_on_save = require("format-on-save")
    local formatters = require("format-on-save.formatters")

    format_on_save.setup({
      exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
      },

      javascript = formatters.shell({ cmd = { "prettierd", "%" } }),
      typescript = formatters.shell({ cmd = { "prettierd", "%" } }),
      typescriptreact = formatters.shell({ cmd = { "npx", "prettier", "%", '--write' } }),

      -- formatter_by_ft = {
      --   -- css = formatters.lsp,
      --   -- html = formatters.lsp,
      --   -- javascript = formatters.lsp,
      --   -- json = formatters.lsp,
      --   -- lua = formatters.lsp,
      --   -- markdown = formatters.prettierd,
      --   typescript = formatters.prettierd,
      --   typescriptreact = formatters.prettierd,
      --   -- yaml = formatters.lsp,
      -- },

      -- javascript = {
      --   formatters.if_file_exists({
      --     pattern = ".eslintrc.*",
      --     formatter = formatters.eslint_d_fix
      --   }),
      --   formatters.if_file_exists({
      --     pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
      --     formatter = formatters.prettierd,
      --   }),
      -- }
    })
  end
}
