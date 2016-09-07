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

function! NextError()
  :Errors
  :lclose
  :lnext
endfunction

" show and hide errors
nmap <silent> q :call NextError()<CR>
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

" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>

" MINI Buf Expl
map <Leader>b :MBEToggle<cr>
map <Leader>h :MBEbp<cr>
map <Leader>l :MBEbn<cr>
map <Leader>d :MBEbd<cr>
let g:miniBufExplBRSplit = 0
let g:miniBufExplAutoStart = 0

nmap <F5> :leftabove  vnew<CR>
nmap <F6> :leftabove  new<CR>
nmap <F7> :rightbelow new<CR>
nmap <F8> :rightbelow vnew<CR>

nnoremap <left> <C-W><C-H>
nnoremap <right> <C-W><C-L>
nnoremap <down> <C-W><C-J>
nnoremap <up> <C-W><C-K>

set nofoldenable    " disable folding

nnoremap <F10> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
  bufdo execute "setlocal nofoldenable"
endfunction

nmap P <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
