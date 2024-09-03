return {
  'nvim-tree/nvim-tree.lua',
  tag = 'v1.4.0',
  config = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        adaptive_size = true,
      },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        highlight_modified = 'name',
        icons = {
          webdev_colors = false,
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = false,
            modified = false,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        -- disable git integration because it's slow
        enable = false,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
      end,
    })

    -- keybindings
    local opts = { noremap = true, silent = true }

    -- vim.api.nvim_set_keymap('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", opts)
    vim.api.nvim_set_keymap('n', '<C-n>', "<cmd>NvimTreeFindFileToggle<CR>", opts)

    -- open nvim-tree on startup
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function(data)
        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not directory then
          return
        end

        -- change to the directory
        vim.cmd.cd(data.file)

        -- open the tree
        require("nvim-tree.api").tree.open()
      end
    })
  end
}
