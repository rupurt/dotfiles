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
xmap <leader>/  <Plug>Commentary
nmap <leader>/  <Plug>Commentary
nmap <leader>// <Plug>CommentaryLine


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


" CTAGS
"
let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:rails_ctags_arguments='--exclude=".git" --exclude="log"'

" TODO: adjust for rbenv or chruby
" ctags again with gemhome added
" map <leader>rt :!/usr/local/bin/ctags -R --exclude=.git --exclude=log * `echo ~/code/schoolkeep/`/*<CR>
" map <leader>rT :!rdoc -f tags -o tags * `echo ~/code/schoolkeep/` --exclude=.git --exclude=log

map <leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>
