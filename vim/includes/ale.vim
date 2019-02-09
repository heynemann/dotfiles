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

let g:ale_cpp_clang_executable = 'clang++-6.0'
let g:ale_c_clangformat_executable = 'clang-format-6.0'
let g:ale_cpp_gcc_options = "-std=c++14 -I./node_modules/node-addon-api/ -I$HOME/.node-gyp/11.8.0/include/node/"
let g:ale_cpp_clang_options = "-std=c++14 -I./node_modules/node-addon-api/ -I~/$HOME/node-gyp/11.8.0/include/node/"

let g:ale_linters = {
  \   'csh': ['shell'],
  \   'cs': ['omnisharp', 'mcsc'],
  \   'cpp': ['gcc', 'cpplint', 'cppcheck', 'flawfinder'],
  \   'go': ['gofmt', 'gometalinter'],
  \   'html': ['tidy'],
  \   'htmldjango': ['tidy'],
  \   'hack': ['hack', 'hhast'],
  \   'help': [],
  \   'perl': ['perlcritic'],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'javascript': ['flow', 'eslint'],
  \   'typescript': ['tslint', 'typecheck', 'tsserver'],
  \   'typescript.tsx': ['tslint', 'typecheck', 'tsserver'],
  \   'javascript.jsx': ['eslint'],
  \   'rust': ['cargo'],
  \   'spec': [],
  \   'text': [],
  \   'zsh': ['shell']
\}

let g:ale_fixers = {
\   'python': [
\       'isort',
\       'yapf',
\       'black',
\       'remove_trailing_lines',
\       'trim_whitespace',
\       'add_blank_lines_for_python_control_statements'
\   ],
\   'hack': [
\       'hackfmt',
\   ],
\   'javascript': [
\       'prettier',
\		'eslint',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'javascript.jsx': [
\       'prettier',
\       'eslint',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'typescript': [
\		'prettier',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'typescript.tsx': [
\		'prettier',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'cpp': [
\       'clang-format',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'cs': [
\       'uncrustify',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ]
\}

let g:ale_typescript_tslint_use_global = 0
" let g:ale_c_uncrustify_options = '-c ~/.uncrustify.cfg'
let g:ale_c_uncrustify_options = ''
