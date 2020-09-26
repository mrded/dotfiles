:command! TestRun vsplit term://npx jest %
:command! TestRunWatch vsplit term://npx jest % --watch

:command! TestFrontendRun vsplit term://cd frontend; npx jest %
:command! TestFrontendRunUpdateSnapshots vsplit term://cd frontend; npx jest --updateSnapshot %
:command! TestFrontendRunWatch vsplit term://cd frontend; npx jest % --watch
:command! TestFrontendRunAll vsplit term://cd frontend; npx jest 
:command! TestFrontendRunAllUpdateSnapshots vsplit term://cd frontend; npx jest --updateSnapshot

:command! NPMBuild vsplit term://npm i && npm run build
:command! NPMFormat vsplit term://npm run format
:command! NPMLint vsplit term://npm run lint 
