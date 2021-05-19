:command! TestRun vsplit term://npx jest % --watch
:command! TestRunOff vsplit term://npx jest --ci --selectProjects offline -- testMatch % --watch
:command! TestRunSvc vsplit term://npx jest --ci --selectProjects service -- testMatch % --watch
:command! TestRunFrontend vsplit term://cd frontend; npx jest % --watch

:command! TestSnapshotUpdate vsplit term://npx jest --updateSnapshot %
:command! TestSnapshotUpdateAll vsplit term://npx jest --updateSnapshot

:command! NPMBuild vsplit term://npm i && npm run build
:command! NPMFormat vsplit term://npm run format
:command! NPMLint vsplit term://npm run lint 


" TODO: CtrlSFFrontend
" TODO: CtrlSFFrontendTests
"
" TODO: CtrlSFBackend
" TODO: CtrlSFBackendTests
