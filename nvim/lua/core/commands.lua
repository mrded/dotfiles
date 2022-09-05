-- One of the most annoying things about vim was that I frequently typed :W instead of :w.
vim.cmd('command! W w')

vim.cmd('command! TestRun vsplit term://npx jest % --watch')
vim.cmd('command! Rename :lua vim.lsp.buf.rename()')

-- Automatic formation on save
vim.cmd [[
  :command! Format :lua vim.lsp.buf.format { async = true }

  autocmd BufWritePre *.js,*.ts,*.tsx :Format
  autocmd BufWritePre *.go :Format 
]]
