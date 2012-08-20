"
" Maintainer:  David Wu <david@wu-man.com>
" Project URL: https://github.com/wuman/vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Environment
"
" pathogen (must be placed in the beginning of this file)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"
" General
"
set nocompatible             " not compatible with the old-fashion vi mode


"
" User Interface
"
set showmode                 " display the current mode
set ruler                    " always show current position
set autoread                 " auto read when file is changed from outside
set bs=2                     " allow backspacing over everything in insert mode
set nu                       " display line numbers

filetype on                  " enable filetype detection
filetype indent on           " enable filetype-specific indenting
filetype plugin on           " enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! BufWritePost .vimrc source ~/.vimrc


"
" Colors and Fonts
"
syntax on                    " enable syntax highlighting
set hlsearch                 " highlight search results
set cursorline               " highlight current line

set background=dark          " set background dark
set t_Co=256                 " 256 color mode

if has("gui_running")
  colorscheme moria
else
  colorscheme wombat256mod
endif


"
" Formatting
"
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>         " toggle paste mode
set ffs=unix,dos,mac         " use unix as standard file format


"
" Encoding
"
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8                                  
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8                                  
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun

