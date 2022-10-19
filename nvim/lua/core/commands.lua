-- One of the most annoying things about vim was that I frequently typed :W instead of :w.
vim.cmd('command! W w')

vim.cmd('command! TestRun vsplit term://npx jest % --watch --runInBand')
vim.cmd('command! Rename :lua vim.lsp.buf.rename()')

-- Automatic formation on save
vim.cmd [[
  :command! Format :lua vim.lsp.buf.format { async = true }
  :command! FormatJS !prettier --write --loglevel silent --ignore-unknown %

  autocmd BufWritePre *.go :Format 
  autocmd BufWritePre *.js,*.ts,*.tsx :Format
]]
