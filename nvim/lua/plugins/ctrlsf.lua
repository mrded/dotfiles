return function(use)
  use {
    "dyng/ctrlsf.vim",
    tag = 'v2.6.0',
    config = function() 
      vim.cmd [[
        " @TODO: map Ctrl+* to <Plug>CtrlSFPrompt

        let g:ctrlsf_search_mode = 'sync'
        let g:ctrlsf_position = 'bottom'
        let g:ctrlsf_winsize = '50%'
        let g:ctrlsf_auto_focus = { "at": "start" }

        let g:ctrlsf_ignore_dir = [
              \ "node_modules",
              \ "bower_components",
              \ "cache",
              \ "vendor",
              \ "build",
              \ "dist",
              \ "build",
              \ "coverage",
              \ "__snapshots__",
              \ "__mocks__",
              \ "build-with-tests",
              \ "build-with-tests-jest",
              \ "dist-with-tests",
              \ "public",
              \ ]
      ]]
    end
  }
end
