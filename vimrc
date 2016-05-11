"
" Maintainer:  David Wu <david@wu-man.com>
" Project URL: https://github.com/wuman/vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Environment
"
" pathogen (must be placed in the beginning of this file)
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"
" General
"
set nocompatible             " not compatible with the old-fashion vi mode
set history=100              " store 100 lines of history

" enable basic mouse behavior such as resizing buffers.
"set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

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
autocmd FileType javascript,jade set tabstop=2|set softtabstop=2|set shiftwidth=2


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
" Files
"
set nobackup                 " no *~ backup files

if !isdirectory($HOME . "/.cache/vim")
    call mkdir($HOME . "/.cache/vim", "p")
"	:silent !install -dm700 ~/.cache/vim >/dev/null 2>&1
endif
set directory=~/.cache/vim//


"
" Statusline
"
set laststatus=2


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

" vim-autoformat: use sourcebeautify shortcut
nmap <leader>sb :Autoformat<CR>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" Disable use of tab in YouCompleteMe
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" vim-jsx enable jsx syntax highlighting in .js files too
let g:jsx_ext_required = 0

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
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

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

"
" Plugins
"
" vim-airline
set timeout timeoutlen=1000 ttimeoutlen=50
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
" uncomment lines below to define straight tab separators
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" JSON.vim http://www.vim.org/scripts/script.php?script_id=1945
au! BufRead,BufNewFile *.json set filetype=json

" vim-javascript
let javascript_fold=1

" SnipMate
let g:snipMateAllowMatchingDot = 0

" xmledit - enable auto-close tags for html files
let g:xmledit_enable_html=1

" ctrlp.vim
let g:ctrlp_max_files = 500
let g:ctrlp_working_path_mode = 'c'

" NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" toggle nerdtree drawer
nnoremap <leader>d :NERDTreeToggle<CR>
" open nerdtree to the current file
nnoremap <leader>f :NERDTreeFind<CR>

" EasyMotion
" let g:EasyMotion_leader_key = '<Leader>'
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_list_type = "quickfix"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": ["go"] }
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_args =
    \ "--disable-all --enable=vet --enable=golint --enable=errcheck --deadline=5s " .
    \ "--include='^" . expand('%:p') . ".*$'"
noremap  <C-w>r :SyntasticReset<CR>
noremap! <C-w>r <Esc>:SyntasticReset<CR>
noremap  <C-w>t :SyntasticToggle<CR>
noremap! <C-w>t <Esc>:SyntasticToggle<CR>
noremap  <C-w>c :SyntasticCheck<CR>
noremap! <C-w>c <Esc>:SyntasticCheck<CR>
