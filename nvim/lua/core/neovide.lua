if vim.g.neovide then
  vim.o.guifont = "Monaco:h12"
  vim.opt.linespace = 3

  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y')    -- Copy
  vim.keymap.set('n', '<D-v>', '"+P')    -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P')    -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<C-R>+') -- Paste insert mode

  -- Disable horizontal scroll
  vim.api.nvim_set_keymap('n', '<ScrollWheelRight>', '<Nop>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<ScrollWheelLeft>', '<Nop>', { noremap = true })

  vim.g.neovide_show_border = true
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_corner_radius = 0.5
end
