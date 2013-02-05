source ~/.vim/includes/general
filetype off

set rtp+=~/.vim/thirdparty/vundle/
call vundle#rc()

source ~/.vim/includes/bundles

filetype plugin indent on     " required!

colorscheme rdark

source ~/.vim/includes/ctrlp
