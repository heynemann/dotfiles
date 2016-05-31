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
nmap <silent> Q :lprev<CR>
nmap <silent> <Leader>q :Errors<CR>

" http://vimbits.com/bits/92
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" color cycling
map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>

" close quick tips
map <silent><F12> :cclose<cr>

" nose focus
map <Leader>f :call InsertFocus()<CR>
function! InsertFocus()
  let trace = expand("from nose_focus import focus  # NOQA")
  execute "normal o".trace
  let trace = expand("@focus  # NOQA")
  execute "normal o".trace
endfunction

" whitespace
"
:nnoremap <silent> <Leader>m :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"map <Leader>m :FixWhitespace<CR>
map <Leader><Leader>b :bufdo bd<CR>

:imap jj <Esc>

" EASYMOTION
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
