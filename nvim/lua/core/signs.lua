-- Define custom bookmark sign
vim.fn.sign_define('heartSign', {
  text = '♥',
  texthl = 'Hint'
})

-- Command to add a bookmark at the current line
vim.api.nvim_create_user_command('Bookmark', function()
  local current_line = vim.fn.line('.')
  vim.fn.sign_place(1, '', 'heartSign', '', {
    lnum = current_line
  })
end, {})

-- Command to remove all bookmarks
vim.api.nvim_create_user_command('BookmarkRemove', function()
  vim.fn.sign_unplace('')
end, {})
