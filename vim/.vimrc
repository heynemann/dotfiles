source ~/.vim/includes/general
filetype off

autocmd! bufwritepost .vimrc source %

set rtp+=~/.vim/thirdparty/vundle/
call vundle#rc()

source ~/.vim/includes/bundles

filetype plugin indent on     " required!

colorscheme jellybeans

highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

source ~/.vim/includes/ctrlp
source ~/.vim/includes/nerdtree
source ~/.vim/includes/neocomplcache

map <Leader>b :call InsertLine()<CR>

function! InsertLine()
  let trace = expand("import ipdb; ipdb.set_trace()")
  execute "normal o".trace
endfunction
