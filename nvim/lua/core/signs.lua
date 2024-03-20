vim.cmd([[sign define heartSign text=♥ texthl=Hint]])

vim.api.nvim_create_user_command('Bookmark', function()
  local current_line = vim.fn.line('.')
  local cmd = string.format("sign place 1 line=%d name=heartSign", current_line)
  vim.cmd(cmd)
end, {})

vim.api.nvim_create_user_command('BookmarkRemove', function()
  vim.cmd("sign unplace")
end, {})
