-- One of the most annoying things about vim was that I frequently typed :W instead of :w.
vim.cmd('command! W w')
vim.cmd('command! V v')

vim.cmd('command! TestRunWatch vsplit term://npx jest % --watch --runInBand --no-cache --coverage=false')
vim.cmd('command! JestRun vsplit term://npx jest % --watch --runInBand --no-cache --coverage=false')
vim.cmd('command! VitestRun vsplit term://npx vitest run % --watch --coverage=false')
vim.api.nvim_create_user_command('Rename', function() vim.lsp.buf.rename() end, { nargs = 0 })
-- vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format() end, { nargs = 0 })

local function create_window()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  -- calculate the center position
  local win_height = math.ceil(height * 0.9 - 4)
  local win_width = math.ceil(width * 0.9)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded"
  })
end

vim.api.nvim_create_user_command('TestRun', function()
  local file_path = vim.fn.expand("%")

  create_window()

  vim.fn.termopen("npx jest " .. file_path .. " --runInBand --no-cache --coverage=false")
end, {})

vim.api.nvim_create_user_command('Terminal', function(opts)
  create_window()

  vim.cmd("terminal")
end, {})

vim.api.nvim_create_user_command('Find', function(opts)
  -- TODO: WIP.
  create_window()

  -- Run :CtrlSF with the provided argument
  local search_term = opts.args
  if search_term ~= "" then
    vim.cmd("CtrlSF " .. search_term)
  else
    print("Please provide a search term.")
  end
end, { nargs = 1 })


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
