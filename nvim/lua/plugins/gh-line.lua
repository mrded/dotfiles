-- opens a link to the current line on GitHub
return {
  "ruanyl/vim-gh-line",
  config = function()
    vim.cmd [[
        :command! GitHub GH
        " :command! GitHubBlame GB
      ]]
  end
}
