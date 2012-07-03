set t_vb= 
colorscheme oceanblack

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 18
  elseif has("gui_photon")
    set guifont=Inconsolata:s18
  elseif has("gui_kde")
    set guifont=Inconsolata/18/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-inconsolata-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Inconsolata:h18
  endif
endif

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

"autocmd FileType python compiler pylint

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set expandtab

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

set wrap
set textwidth=79
set formatoptions=qrn1
set fuopt=maxvert,maxhorz

nmap <leader>l :set list!<CR>
set list
set listchars=tab:▸\ ,eol:¬

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
au FocusLost * :wa

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>v V`]

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nnoremap <leader>w <C-w>v<C-w>l

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

nmap <silent> <c-n> :NERDTreeToggle<CR>

au BufNewFile,BufRead *.less set filetype=less

"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

augroup mkd
    autocmd BufRead,BufEnter *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead,BufEnter *.md set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead,BufEnter *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

nmap <silent> <Leader>y :CtrlPMRU<CR>
nmap <silent> <Leader>t :CtrlP<CR>
let g:ctrlp_open_new_file = 't'
let g:ctrlp_lazy_update = 100
let g:ctrlp_max_height = 30
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_relative = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$\|.*\.egg-info.*$',
	\ 'file': '\.DS_Store$\|\.so$\|\.jpg|\.gif|\.png|\.psd$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

" Removes trailing spaces
function! TrimWhiteSpace()
  :retab
  %s/\s*$//
  ''
:endfunction

map <F2> :call TrimWhiteSpace()<CR>
map <F1> :tabnew<CR> 

nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

let g:pyflakes_use_quickfix = 0

let $JS_CMD='node'

cmap w!! w !sudo tee % >/dev/null

nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>
