return {
  'stevearc/conform.nvim',
  tag = 'v9.0.0',
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        json = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        markdown = { 'prettier' },
      },
    }
  end
}
