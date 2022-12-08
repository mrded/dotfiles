return function(use)
  use {
    'scrooloose/nerdtree',
    tag = '6.10.16',
    requires = {
      'Xuyuanp/nerdtree-git-plugin',
    },
    config = function()
      vim.cmd [[
        nnoremap <C-n> :NERDTreeToggle<cr>
        nnoremap <C-b> :NERDTreeFind<cr>

        let NERDTreeMarkBookmarks = 1
        let NERDTreeShowHidden = 1
        let NERDTreeShowLineNumbers = 0
        let NERDTreeStatusline = 0
        let NERDTreeMinimalUI = 1
        let NERDTreeAutoDeleteBuffer = 1
      ]]
    end
  }
end
