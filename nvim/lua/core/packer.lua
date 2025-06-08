-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

packer.reset()
packer.init({
  display = {
    open_fn = require('packer.util').float,
    autoremove = true,
  },
})

packer.startup(function(use)
  -- Load all plugin specs from lua/plugins/*.lua
  local plugin_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins", "*.lua", false, true)

  for _, file in ipairs(plugin_files) do
    local spec = dofile(file)
    if spec then use(spec) end
  end
end)
