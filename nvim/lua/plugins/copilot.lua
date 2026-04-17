-- you need to run ':Copilot setup' manually
return {
  'github/copilot.vim',
  tag = 'v1.59.0',
  config = function()
    vim.g.copilot_node_command = "~/.nvm/versions/node/v22.21.1/bin/node"
  end
}
