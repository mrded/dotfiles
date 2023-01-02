-- One of the most annoying things about vim was that I frequently typed :W instead of :w.
vim.cmd('command! W w')

vim.cmd('command! TestRun vsplit term://npx jest % --watch --runInBand --no-cache')
vim.api.nvim_create_user_command('Rename', function() vim.lsp.buf.rename() end, { nargs = 0 })

vim.api.nvim_create_user_command('Ghistory', require("vgit").buffer_history_preview, { nargs = 0 })
vim.api.nvim_create_user_command('Gblame', require("vgit").buffer_blame_preview, { nargs = 0 })
vim.api.nvim_create_user_command('GblameGutter', require("vgit").buffer_gutter_blame_preview, { nargs = 0 })

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
