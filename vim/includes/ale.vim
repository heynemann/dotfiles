" ALE

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_fix_on_save = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

nmap <silent> Q <Plug>(ale_previous_wrap)
nmap <silent> q <Plug>(ale_next_wrap)

let g:ale_linters = {
  \   'csh': ['shell'],
  \   'go': ['gofmt', 'golint', 'go vet'],
  \   'help': [],
  \   'perl': ['perlcritic'],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'javascript': ['standard'],
  \   'rust': ['cargo'],
  \   'spec': [],
  \   'text': [],
  \   'zsh': ['shell'],
\}

let g:ale_fixers = {
\   'python': [
\       'isort',
\       'yapf',
\       'remove_trailing_lines',
\       'trim_whitespace',
\       'add_blank_lines_for_python_control_statements'
\   ],
\   'javascript': [
\       'prettier',
\       'prettier_standard',
\       'standard',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ]
\}
