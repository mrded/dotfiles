vim.filetype.add({
  extension = { mdx = 'mdx' }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.md", "*.css", "*.scss" },
  callback = function(args)
    require("conform").format({ async = false, bufnr = args.buf })
  end,
})
