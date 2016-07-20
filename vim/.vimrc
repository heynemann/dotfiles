set shell=/bin/bash
source ~/.vim/includes/general.vim
source ~/.vim/includes/mappings.vim
source ~/.vim/includes/neobundle.vim
source ~/.vim/includes/neocomplete.vim
source ~/.vim/includes/ctrlp.vim
source ~/.vim/includes/airline.vim
source ~/.vim/includes/syntastic.vim
source ~/.vim/includes/govim.vim
source ~/.vim/includes/js.vim
source ~/.vim/includes/ultisnips.vim

" gotta be last thing because bundles must be loaded
colorscheme molokai

" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

" Set this to have long lines wrap inside comments.
autocmd FileType fish setlocal textwidth=79

" Enable folding of block structures in fish.
autocmd FileType fish setlocal foldmethod=expr
