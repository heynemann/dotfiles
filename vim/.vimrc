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
