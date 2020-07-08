:command! ShowTestCases g/ \(describe\|it\)( 

:command! RunTest vsplit term://npx jest %
:command! RunTestWatch vsplit term://npx jest % --watch
