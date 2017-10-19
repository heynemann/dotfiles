" search easily
nnoremap / /\v
vnoremap / /\v

" remove search highlight
nnoremap <leader><space> :noh<cr>

" cycle through parenthesis
nnoremap <tab> %
vnoremap <tab> %

" no more arrows for you
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

" please no help ever
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" use ; as leader as well
nnoremap ; :

" linux CTRL+T
map <F1> :tabnew<CR>

" show and hide errors
nmap <silent> q :lnext<CR>
nmap <silent> Q :lnext<CR>

" Keep search pattern at the center of the screen - http://vimbits.com/bits/92
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" close quick tips
map <silent><F12> :cclose<cr>

" whitespace
"
":nnoremap <silent> <Leader>m :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
:nnoremap <silent> <Leader>m :StripWhitespace

" delete all buffers
map <Leader>b :bufdo bd<CR>

set nofoldenable    " disable folding

"map <Leader>f :%!python -m json.tool<CR>

map <Leader>q :RestartVim<CR>

map <Leader>/ :%!prettier --print-width 100 --no-bracket-spacing --single-quote --write % && ./node_modules/.bin/eslint --fix %<CR>

noremap <F3> :Autoformat<CR>
