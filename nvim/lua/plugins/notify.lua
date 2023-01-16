return {
  'rcarriga/nvim-notify',
  tag = 'v3.10.1',
  config = function()
    local notify = require('notify')

    notify.setup({
      render = "simple",
    })

    -- Override the default notification handler
    vim.notify = notify
  end
}
