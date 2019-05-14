let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '!'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

" enable prettier on save.
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}
