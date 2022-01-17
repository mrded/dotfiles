:command! TestRun vsplit term://npx jest % --watch
:command! Rename :lua vim.lsp.buf.rename() 
