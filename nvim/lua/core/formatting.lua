vim.filetype.add({
  extension = { mdx = 'mdx' }
})

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.vue" },
    callback = function() vim.lsp.buf.format({ async = false }) end
  }
)

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.lua" },
    callback = function() vim.lsp.buf.format({ async = false }) end
  }
)

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.go" },
    callback = function() vim.lsp.buf.format({ async = false }) end
  }
)
