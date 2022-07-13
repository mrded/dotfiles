return function(use)
  use {
    "ruanyl/vim-gh-line",
    config = function() 
      vim.cmd [[
        :command! GitHub GH 
        " :command! GitHubBlame GB 
      ]]
    end
  }
end
