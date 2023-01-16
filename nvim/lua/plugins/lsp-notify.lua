return {
  'mrded/nvim-lsp-notify',
  -- '~/Projects/nvim-lsp-notify',
  tag = '1.0.0',
  config = function()
    local notify = require('notify')

    require('lsp-notify').setup({
      notify = notify,
    })
  end
}
