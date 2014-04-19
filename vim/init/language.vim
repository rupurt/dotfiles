" strip trailing whitespace on save for code files
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

" rails
autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.scss,*.html,*.xml,*.erb,*.haml call StripTrailingWhitespace()

" misc
autocmd BufWritePre *.feature call StripTrailingWhitespace()

" Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,config.ru} set filetype=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set filetype=javascript

" set question mark to be part of a VIM word. in Ruby it is!
autocmd FileType ruby set iskeyword=@,48-57,_,?,!,192-255
autocmd FileType scss set iskeyword=@,48-57,_,-,?,!,192-255

function! SetupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

au BufRead,BufNewFile *.txt call SetupWrapping()

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
