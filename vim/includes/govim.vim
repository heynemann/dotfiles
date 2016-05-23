let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'gofmt', 'gometalinter', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"


let g:go_fmt_command = "goimports"

"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1

"let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
"au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
"au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
"au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

"au Filetype go nnoremap <leader>r :GoRun %<CR>
