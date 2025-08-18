return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  requires = { 'williamboman/mason.nvim' },
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'sonarlint-language-server',
      },
      auto_update = false,
      run_on_start = true,
      start_delay = 5000,
      debounce_hours = 5,
    }
  end
}

