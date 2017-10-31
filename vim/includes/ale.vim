" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

nmap <silent> Q <Plug>(ale_previous_wrap)
nmap <silent> q <Plug>(ale_next_wrap)
