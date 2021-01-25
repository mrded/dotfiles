if match(&runtimepath, 'gh-line') != -1
  :command! GitHubOpen execute "normal " . mapleader . "gh"
  :command! GitHubBlame execute "normal " . mapleader . "gb" 
endif

