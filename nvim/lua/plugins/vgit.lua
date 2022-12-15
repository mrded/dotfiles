return function(use)
  use {
    'tanvirtin/vgit.nvim',
    tag = 'v0.1.2',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('vgit').setup({
        settings = {
          live_blame = {
            enabled = false,
          }
        }
      })
    end
  }
end
