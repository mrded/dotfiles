let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1

" Apply Prettier on file save
:autocmd BufWritePost * execute 'PrettierAsync'
