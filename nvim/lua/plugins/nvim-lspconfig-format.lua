vim.cmd [[
  :command! Format :lua vim.lsp.buf.formatting()

  autocmd BufWritePre *.js,*.ts,*.tsx :Format
  autocmd BufWritePre *.go :Format 
]]
