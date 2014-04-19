" VIM-SURROUND
"
" Add $ as a jQuery surround, _ for Underscore.js
autocmd FileType javascript let b:surround_36 = "$(\r)"
                        \ | let b:surround_95 = "_(\r)"

" VIM-FUGITIVE
map <leader>g   :Gblame<CR>


" NERDTREE
"
" Small default width for NERDTree pane
let g:NERDTreeWinSize = 20
" Change working directory if you change root directories
let g:NERDTreeChDirMode=2
" Show dotfiles by default
let NERDTreeShowHidden=1

" File tree browser
map \ :NERDTreeToggle<CR>
" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>


" VIM-COMMENTARY
"
xmap <leader>/ <Plug>Commentary
nmap <leader>/ <Plug>CommentaryLine


" AG
"
function! AgGrep()
  let command = "ag ".expand("<cword>")
  cexpr system(command)
  cw
endfunction

function! AgVisual()
  normal gv"xy
  let command = "ag ".@x
  cexpr system(command)
  cw
endfunction

" AgGrep current word
map <leader>a :call AgGrep()<CR>
" AgVisual current selection
vmap <leader>a :call AgVisual()<CR>


" CTRL-P
"
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>F :ClearCtrlPCache<CR>\|:CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'


" Markdown
"
let g:vim_markdown_folding_disabled=1


" Splitjoin
"
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

nmap Ss :SplitjoinSplit<cr>
nmap Sj :SplitjoinJoin<cr>


" vim-dispatch + RSpec.vim
"
let g:rspec_command = "Dispatch rspec {spec}"
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>

" non-capture dispatch
let g:debug_rspec_command = "Start rspec {spec}"
function! StartCurrentSpecFile()
  let previous_command = g:rspec_command
  let g:rspec_command = g:debug_rspec_command
  call RunCurrentSpecFile()
  let g:rspec_command = previous_command
endfunction

function! StartNearestSpec()
  let previous_command = g:rspec_command
  let g:rspec_command = g:debug_rspec_command
  call RunNearestSpec()
  let g:rspec_command = previous_command
endfunction

function! StartLastSpec()
  let previous_command = g:rspec_command
  let g:rspec_command = g:debug_rspec_command
  call RunLastSpec()
  let g:rspec_command = previous_command
endfunction

map <leader>dt :call StartCurrentSpecFile()<CR>
map <leader>ds :call StartNearestSpec()<CR>
map <leader>dl :call StartLastSpec()<CR>


" CTAGS
"

map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=log --exclude=doc -R *<CR><CR>
map <C-\> :tnext<CR>

" AutoTag
let g:autotagExcludeSuffixes="tml.xml.text.txt.vim"

" Rails.vim
let g:rails_ctags_arguments='--exclude=".git" --exclude="log" --exclude="doc" --exclude="spec/javascripts/helpers"'


" MISC
"

" File Renaming (credit: garybernhardt)
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" Smart Tab completion (credit: garybernhardt)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Promote to let (credit: garybernhardt)
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
  " :normal! <<
  " :normal! ilet(:
  " :normal! f 2cl) {
  " :normal! A }
endfunction
:command! PromoteToLet :call PromoteToLet()
map <leader>p :PromoteToLet<cr>
