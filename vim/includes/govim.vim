let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_autosave = 1
let g:go_list_type = "quickfix"

:autocmd BufWritePre *.go :pclose

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" function! OpenCompletion()
    " if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
        " call feedkeys("\<C-x>\<C-o>", "n")
    " endif
" endfunction

" autocmd InsertCharPre * call OpenCompletion()

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
