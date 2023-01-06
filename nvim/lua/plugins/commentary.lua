return {
  "tpope/vim-commentary",
  tag = 'v1.3',
  config = function()
    vim.cmd [[
        autocmd FileType vue setlocal commentstring=\/\/\ %s
      ]]
  end
}
