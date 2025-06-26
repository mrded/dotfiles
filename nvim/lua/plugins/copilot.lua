-- you need to run ':Copilot setup' manually
return {
  'github/copilot.vim',
  tag = 'v1.50.0',
  config = function()
    vim.g.copilot_node_command = "~/.nvm/versions/node/v20.12.2/bin/node"
  end
}
