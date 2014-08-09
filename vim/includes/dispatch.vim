autocmd FileType python let b:dispatch = 'nosetests --with-yanc --logging-level=WARNING %'
nnoremap <F9> :make test<CR>
nnoremap <F10> :Dispatch<CR>
nnoremap <F11> :Dispatch nosetests -vv --with-yanc --logging-level=WARNING --with-focus -s<CR><C-W>jG<C-W>k
