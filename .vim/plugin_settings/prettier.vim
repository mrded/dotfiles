let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0

" Apply Prettier on file save
:autocmd BufWritePre * execute 'silent PrettierAsync'
