let g:syntastic_python_checkers = ['flake8']
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 2
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
nnoremap <silent> Q :SyntasticCheck<cr>
