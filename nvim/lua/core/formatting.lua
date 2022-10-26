local lsp_formatting = function()
    vim.lsp.buf.format({ async = false })
end

local js_formatting = function()
    -- see: http://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
    vim.lsp.buf.format {
    async = false
    -- Never request typescript-language-server for formatting
    -- filter = function(client) return client.name ~= "tsserver" end
}
end

vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = { "*.js", "*.ts", "*.tsx" }, callback = js_formatting }
)

vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = { "*.lua" }, callback = lsp_formatting }
)

vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = { "*.go" }, callback = lsp_formatting }
)
