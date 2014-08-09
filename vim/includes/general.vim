set t_vb=

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ for\ Powerline\ 17
  elseif has("gui_photon")
    set guifont=Inconsolata:s17
    set fuopt=maxvert,maxhorz
  elseif has("gui_kde")
    set guifont=Inconsolata/17/-1/5/50/0/0/0/1/0
    set fuopt=maxvert,maxhorz
  elseif has("x11")
    set guifont=-*-inconsolata-medium-r-normal-*-*-170-*-*-m-*-*
    set fuopt=maxvert,maxhorz
  else
    set guifont=Inconsolata:h17
    set fuopt=maxvert,maxhorz
  endif
endif

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set expandtab
set clipboard=unnamed

let mapleader = ","

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set nobackup
set noswapfile

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set wildignore=*.swp,*.bak,*.pyc,*/.git/*
set wildignore+=*/tmp/*,*.so,*.zip   " Linux/MacOSX

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set formatoptions=qrn1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

map <F1> :tabnew<CR>

nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

nmap <silent> q :lnext<CR>
nmap <silent> Q :lprev<CR>
nmap <silent> <Leader>q :Errors<CR>

" http://vimbits.com/bits/92
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

if exists('+colorcolumn')
  set colorcolumn=130
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>130v.\+', -1)
endif

" http://vimbits.com/bits/144
" ****************** SCROLLING *********************

set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15    " Number of cols from horizontal edge to start scrolling
set sidescroll=1        " Number of cols to scroll at a time

map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>
map <silent><F12> :cclose<cr>

map <Leader>b :call InsertPdb()<CR>
map <Leader>f :call InsertFocus()<CR>

function! InsertPdb()
  let trace = expand("import ipdb; ipdb.set_trace()")
  execute "normal o".trace
endfunction

function! InsertFocus()
  let trace = expand("from nose_focus import focus")
  execute "normal o".trace
  let trace = expand("@focus")
  execute "normal o".trace
endfunction
