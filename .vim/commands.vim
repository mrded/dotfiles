:command! TestRun vsplit term://npx jest % --watch

:command! SnapshotFrontendUpdate vsplit term://cd frontend; npx jest --updateSnapshot %
:command! SnapshotFrontendUpdateAll vsplit term://cd frontend; npx jest --updateSnapshot

:command! TestFrontendRun vsplit term://cd frontend; npx jest % --watch
:command! TestFrontendRunAll vsplit term://cd frontend; npx jest 

:command! NPMBuild vsplit term://npm i && npm run build
:command! NPMFormat vsplit term://npm run format
:command! NPMLint vsplit term://npm run lint 

" TODO: CtrlSFFrontend
" TODO: CtrlSFFrontendTests
"
" TODO: CtrlSFBackend
" TODO: CtrlSFBackendTests
