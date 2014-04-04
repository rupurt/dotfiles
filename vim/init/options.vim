set notimeout      " No command timeout

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set numberwidth=4
set nowrap

" completion sources: (current file, loaded buffers, unloaded buffers, tags)
set complete=.,b,u,]

set wildmode=longest,list:longest
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=tags
set wildignore+=*/public/assets/**
set wildignore+=*/tmp/**
set wildignore+=*/log/**
set wildignore+=*/vendor/rails/**
set wildignore+=*/vendor/cache/**
set wildignore+=*.gem
set wildignore+=.git,*.rbc,*.class,.svn,*.png,*.jpg,*.gif

" whitespace stuff
" set list listchars=tab:\ \ ,trail:·
set list " show whitespace
if has("gui_running")
  set listchars=trail:·
else
  set listchars=trail:~
endif

set showtabline=2  " Always show tab bar
set showmatch      " show matching brackets
set hidden         " allow hidden, unsaved buffers
set splitbelow     " add new window towards right
set splitright     " add new window towards bottom
set scrolloff=3    " scroll when the cursor is 3 lines from bottom
set cursorline     " highlight current line

" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Make searches case-sensitive only if they contain upper-case characters
set smartcase

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Write all writeable buffers when changing buffers or losing focus.
" set autowriteall                " Save when doing various buffer-switching things.
" autocmd BufLeave,FocusLost * silent! wall  " Save anytime we leave a buffer or MacVim loses focus.

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
