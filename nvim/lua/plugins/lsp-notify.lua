return {
  'mrded/nvim-lsp-notify',
  -- tag = '1.0.0',
  requires = {
    { 'rcarriga/nvim-notify', tag = 'v3.10.1' }
  },
  config = function()
    local notify = require('notify')

    notify.setup({
      background_colour = "#000000",
    })

    -- Override the default notification handler
    -- vim.notify = notify

    require('lsp-notify').setup({
      notify = notify,
    })
  end
}
