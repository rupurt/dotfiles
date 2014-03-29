set notimeout      " No command timeout
set showcmd

set expandtab
set tabstop=2
set autoindent
set shiftwidth=2
set softtabstop=2
set number
set numberwidth=4
set nowrap
set backspace=indent,eol,start

set wildmode=list:longest,list:full
set wildignore+=tags
set wildignore+=tmp/**
set wildignore+=public/uploads/**
set wildignore+=public/images/**
set wildignore+=vendor/**
set wildignore+=.git,*.rbc,*.class,.svn,*.png

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

set laststatus=2   " always show staus line

set incsearch      " incremental search
set encoding=utf-8

" Remember more commands and search history
set history=1000

" Make searches case-sensitive only if they contain upper-case characters
set smartcase

" no prompt for file changes outside of vim
set autoread

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" show the cursor position all the time
set ruler

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
