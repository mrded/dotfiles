-- One of the most annoying things about vim was that I frequently typed :W instead of :w.
vim.cmd('command! W w')
vim.cmd('command! V v')

vim.cmd('command! TestRun vsplit term://npx jest % --watch --runInBand --no-cache --coverage=false')
vim.api.nvim_create_user_command('Rename', function() vim.lsp.buf.rename() end, { nargs = 0 })

vim.api.nvim_set_keymap('n', '<C-r>', '', {
  noremap = true,
  desc = 'restarting everything',
  callback = function()
    print('restarting everything')
    vim.cmd('edit')
    -- vim.cmd('PackerSync')
    -- vim.cmd('TSUpdateSync')
    -- vim.cmd('LspRestart')
  end,
})
