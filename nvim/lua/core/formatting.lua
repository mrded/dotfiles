local lsp_formatting = function()
    vim.lsp.buf.format({ async = false })
end

vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = { "*.js", "*.ts", "*.tsx" }, callback = lsp_formatting }
)

vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = { "*.lua" }, callback = lsp_formatting }
)

vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = { "*.go" }, callback = lsp_formatting }
)
