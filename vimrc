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
set history=100              " store 100 lines of history


"
" User Interface
"
set showmode                 " display the current mode
set ruler                    " always show current position
set scrolloff=7              " set scroll offset to 7 lines above/below cursor
set autoread                 " auto read when file is changed from outside
set nu                       " display line numbers
set clipboard=unnamed        " yank to the system register (*) by default
set hid                      " hide abandon buffers in order to not lose undo history
set showmatch                " cursor shows matching ) and }
set incsearch                " incremental search
set ignorecase               " ignore case when searching
set smartcase                " ignore case if search pattern is all lowercase, case-sensitive otherwise
set wildchar=<TAB>           " start wild expansion in the command line using <TAB>
set wildmenu                 " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,b,s,h,l,[,]

filetype on                  " enable filetype detection
filetype indent on           " enable filetype-specific indenting
filetype plugin on           " enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! BufWritePost .vimrc source ~/.vimrc

" disable annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" vimtip#80 restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


"
" Formatting
"
set autoindent               " auto indentation
set copyindent               " copy the previous indentation on autoindenting
set smarttab                 " insert tabs on line start according to context
set expandtab                " replace <TAB> with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType Makefile set noexpandtab


"
" Colors and Fonts
"
syntax on                    " enable syntax highlighting
set hlsearch                 " highlight search results
" highlight current line in the current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

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
" Statusline
"
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


"
" Files
"
set nobackup                 " no *~ backup files


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


"
" Shortcuts
"
" disable arrow keys and force hjkl
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" set leader to ,
let mapleader=","
let g:mapleader=","

" move around splits
map <C-J> <C-W>j<C-W>_       " move to and maximize the below split
map <C-K> <C-W>k<C-W>_       " move to and maximize the above split
nmap <c-h> <c-w>h<c-w><bar>  " move to and maximize the left split
nmap <c-l> <c-w>l<c-w><bar>  " move to and maximize the right split
set wmw=0                    " set the min width of a window to 0 so we can maximize others 
set wmh=0                    " set the min height of a window to 0 so we can maximize others

" move around tabs
" WARN: conflict with the original screen top/bottom, comment them out if you want the original H/L
map <S-H> gT                 " go to prev tab
map <S-L> gt                 " go to next tab

map <C-t><C-t> :tabnew<CR>      " new tab
map <C-t><C-w> :tabclose<CR>    " close tab

nmap <leader>/ :nohl<CR>        " ,/ turns off search highlighting

" bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

" enable function folding
set foldmethod=syntax
set foldlevelstart=10

set cot-=preview             " disable doc preview in omnicomplete

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufNewFile,BufRead *.sass set ft=sass.css


"
" Plugins
"
" JSON.vim http://www.vim.org/scripts/script.php?script_id=1945
au! BufRead,BufNewFile *.json set filetype=json

" vim-javascript
let javascript_fold=1

" SuperTab-continued https://github.com/vim-scripts/SuperTab-continued.
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" SnipMate
let g:snipMateAllowMatchingDot = 0

" NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Command-T
let g:CommandTMaxHeight = 15
" fix key bindings https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux
set ttimeoutlen=50
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" EasyMotion
" let g:EasyMotion_leader_key = '<Leader>'
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

