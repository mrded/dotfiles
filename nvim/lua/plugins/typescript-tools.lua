-- TypeScript/JavaScript LSP (faster alternative to ts_ls)
return {
  src = 'pmizio/typescript-tools.nvim',
  requires = {
    { src = 'nvim-lua/plenary.nvim' },
    { src = 'neovim/nvim-lspconfig' },
  },
  config = function()
    local lsp_config = require('core.lsp')

    -- Filter out unwanted code actions (e.g., "Move to file", "Move to a new file")
    local original_ui_select = vim.ui.select
    vim.ui.select = function(items, opts, on_choice)
      if opts.prompt and opts.prompt:match("Code action") then
        items = vim.tbl_filter(function(item)
          local title = type(item) == "table" and item.action and item.action.title or ""
          return not title:match("^Move to")
        end, items)
      end

      return original_ui_select(items, opts, on_choice)
    end

    require('typescript-tools').setup({
      on_attach = lsp_config.on_attach,
      settings = {
        expose_as_code_action = "all",
      },
    })
  end,
}
