local lsp_formatting = function()
  vim.lsp.buf.format({
    async = false,
    -- only use null-ls
    filter = function(client) return client.name == "null-ls" end
  })
end

vim.api.nvim_create_autocmd(
  "BufWritePre",
  { pattern = { "*.tsx,*.ts,*.jsx,*.js,*.vue" }, callback = lsp_formatting }
)

vim.api.nvim_create_autocmd(
  "BufWritePre",
  { pattern = { "*.lua" }, callback = lsp_formatting }
)

vim.api.nvim_create_autocmd(
  "BufWritePre",
  { pattern = { "*.go" }, callback = lsp_formatting }
)
