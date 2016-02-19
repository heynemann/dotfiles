autocmd FileType python setlocal completeopt-=preview
let g:pymode_folding = 0

let g:pymode_trim_whitespaces = 0

let g:pymode_options_max_line_length = 130

let g:pymode_run = 0
let g:pymode_run_bind = '<C-c>r'

let g:pymode_rope = 0
let g:pymode_rope_rename_bind = '<leader>r'

let g:pymode_rope_autoimport = 0
let g:pymode_rope_autoimport_bind = '<leader>i'

let g:pymode_rope_extract_method_bind = '<leader>rm'
let g:pymode_rope_extract_variable_bind = '<leader>rv'

let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_ignore = "E501"

let g:pymode_doc = 0
let g:pymode_rope_completion = 0
