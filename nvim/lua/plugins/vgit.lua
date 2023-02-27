return {
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

    vim.api.nvim_create_user_command('Ghistory', require("vgit").buffer_history_preview, { nargs = 0 })
    vim.api.nvim_create_user_command('Gblame', require("vgit").buffer_blame_preview, { nargs = 0 })
    vim.api.nvim_create_user_command('GblameGutter', require("vgit").buffer_gutter_blame_preview, { nargs = 0 })
  end
}
