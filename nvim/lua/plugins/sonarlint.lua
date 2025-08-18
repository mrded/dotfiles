return {
  'alnav3/sonarlint.nvim',
  config = function()
    require('sonarlint').setup({
      server = {
        cmd = {
          'sonarlint-language-server',
          '-stdio',
          '-analyzers',
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
        }
      },
      filetypes = {
        'javascript',
        'typescript',
        'typescriptreact',
        'javascriptreact',
      }
    })
  end
}
