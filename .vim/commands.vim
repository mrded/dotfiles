:command! TestCases g/ \(describe\|it\)( 
:command! TestRun vsplit term://npx jest %
:command! TestRunWatch vsplit term://npx jest % --watch
