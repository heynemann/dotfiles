let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_autosave = 1
let g:go_list_type = "quickfix"

:autocmd BufWritePre *.go :pclose