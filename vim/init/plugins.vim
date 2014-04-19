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


" Lightline
"
:set noshowmode " mode is displayed by lightline
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'filename' ],
  \             [ 'ctrlpmark' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'mode': 'MyMode',
  \   'ctrlpmark': 'CtrlPMark',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'fileformat': 'MyFileformat'
  \ }
  \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  let fullname_list = split(expand('%:p'), getcwd() . '/')
  let fullname = fname != '' && len(fullname_list) > 0 ? fullname_list[0] : ''
  let displayname = winwidth(0) > 42 ? fullname : fname
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname =~ 'NERD_tree' ? '' :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != displayname ? displayname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'NERD' && exists('*fugitive#head')
      let mark = ''
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

function! MyFiletype()
  return &filetype == 'nerdtree' ? '' :
        \ winwidth(0) > 70 ? strlen(&filetype) ? &filetype : 'no ft' : ''
endfunction

function! MyFileencoding()
  return &filetype == 'nerdtree' ? '' :
        \ winwidth(0) > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyFileformat()
  return &filetype == 'nerdtree' ? '' :
        \ winwidth(0) > 90 ? &fileformat : ''
endfunction


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
