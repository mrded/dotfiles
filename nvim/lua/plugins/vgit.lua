-- Highlight git changes
return {
  'tanvirtin/vgit.nvim',
  tag = 'v0.2.3',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local vgit = require('vgit')

    vgit.setup({
      settings = {
        live_blame = { enabled = false },
        live_gutter = { enabled = true },
        authorship_code_lens = { enabled = false },
      }
    })

    vim.api.nvim_create_user_command('Ghistory', vgit.buffer_history_preview, { nargs = 0 })
    vim.api.nvim_create_user_command('Gblame', vgit.buffer_gutter_blame_preview, { nargs = 0 })
  end
}
