if match(&runtimepath, 'mustache-handlebars') != -1
  au BufRead,BufNewFile */views/*.html set syntax=mustache
endif
