return {
  'nvim-tree/nvim-tree.lua',
  tag = 'nightly',
  config = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "s", action = "vsplit" },
            { key = "t", action = "tabnew" },
          },
        },
      },
      renderer = {
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = false,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = {
          -- "^\\.env",
        },
        exclude = {},
      },
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
      },
    })

    -- keybindings
    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", opts)
    vim.api.nvim_set_keymap('n', '<C-b>', "<cmd>NvimTreeFindFile<CR>", opts)
  end
}
