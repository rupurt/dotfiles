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
