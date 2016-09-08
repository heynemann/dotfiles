let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['go', 'golint']
let g:go_auto_type_info = 0
let g:go_doc_keywordprg_enabled = 0

:autocmd BufWritePre *.go :pclose
