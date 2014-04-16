" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Leader
let mapleader = ","

" Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Source initialization files
runtime! init/**.vim

" Shared vim settings
if filereadable($HOME . "/.vimrc.shared")
  source ~/.vimrc.shared
endif

" Local vim settings
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
