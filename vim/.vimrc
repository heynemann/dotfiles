"
"   ██╗   ██╗ ██╗ ███╗   ███╗ ██████╗   ██████╗
"   ██║   ██║ ██║ ████╗ ████║ ██╔══██╗ ██╔════╝
"   ██║   ██║ ██║ ██╔████╔██║ ██████╔╝ ██║
"   ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╔══██╗ ██║
" ██╗╚████╔╝  ██║ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗
" ╚═╝ ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝
"
set shell=/bin/bash
source ~/.vim/includes/general.vim
source ~/.vim/includes/mappings.vim
source ~/.vim/includes/better-whitespace.vim
source ~/.vim/includes/vundle.vim
source ~/.vim/includes/airline.vim
source ~/.vim/includes/ctrlp.vim
source ~/.vim/includes/syntastic.vim
source ~/.vim/includes/govim.vim
source ~/.vim/includes/ycm.vim

" gotta be last thing because bundles must be loaded
colorscheme molokai

" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

" Set this to have long lines wrap inside comments.
autocmd FileType fish setlocal textwidth=79
