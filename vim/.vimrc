source ~/.vim/includes/general
filetype off

set rtp+=~/.vim/thirdparty/vundle/
call vundle#rc()

source ~/.vim/includes/bundles

filetype plugin indent on     " required!

colorscheme jellybeans

source ~/.vim/includes/ctrlp

nmap <silent> <Leader>b :Gblame<CR>

let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 1
let g:neocomplcache_enable_auto_select = 1

" python from powerline.bindings.vim import source_plugin; source_plugin()
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

nmap <silent> <Leader>m :NERDTreeToggle<CR>

" Removes trailing spaces
function! TrimWhiteSpace()
  :retab
  %s/\s*$//
  ''
:endfunction

nmap <silent> <Leader>n :call TrimWhiteSpace()<CR>
map <F1> :tabnew<CR> 

nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_mode_map = { 'mode': 'active',
   \ 'active_filetypes': ['ruby', 'python'],
   \ 'passive_filetypes': [] }

let g:syntastic_python_checker_args='--ignore=E501'

