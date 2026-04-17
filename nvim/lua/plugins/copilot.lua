-- you need to run ':Copilot setup' manually
return {
  'github/copilot.vim',
  tag = 'v1.59.0',
  config = function()
    -- Use nvm's default Node version
    local node_path = vim.fn.system('source ~/.nvm/nvm.sh && nvm which default'):gsub('\n', '')
    vim.g.copilot_node_command = node_path
  end
}
