vim.filetype.add({
  extension = { mdx = 'mdx' }
})

-- when lsp is not suporting formatting, use null-ls
local function prefer_non_null_ls_formatter(client)
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })

  for _, c in ipairs(clients) do
    if c.name ~= "null-ls" and c.supports_method("textDocument/formatting") then
      return client.name ~= "null-ls" and client.supports_method("textDocument/formatting")
    end
  end

  return client.name == "null-ls"
end

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.vue" },
    callback = function()
      vim.lsp.buf.format({
        async = false,
        filter = prefer_non_null_ls_formatter,
      })
    end
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
