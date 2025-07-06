return {
  'greggh/claude-code.nvim',
  tag = 'v0.4.3',
  requires = {
    'nvim-lua/plenary.nvim', -- Required for git operations
  },
  config = function()
    require('claude-code').setup()
  end
}
