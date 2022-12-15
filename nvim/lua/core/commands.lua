-- One of the most annoying things about vim was that I frequently typed :W instead of :w.
vim.cmd('command! W w')

vim.cmd('command! TestRun vsplit term://npx jest % --watch --runInBand')
vim.cmd('command! Rename :lua vim.lsp.buf.rename()')
vim.cmd('command! Format :lua vim.lsp.buf.format { async = true }')

vim.cmd('command! Ghistory :lua require("vgit").buffer_history_preview()')
vim.cmd('command! Gblame :lua require("vgit").buffer_blame_preview()')
vim.cmd('command! GblameGutter :lua require("vgit").buffer_gutter_blame_preview()')
