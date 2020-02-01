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
  \   'python': ['flake8', 'mypy'],
  \   'help': [],
  \   'perl': ['perlcritic'],
  \   'javascript': ['eslint'],
  \   'typescript': ['tslint', 'typecheck', 'tsserver'],
  \   'typescript.tsx': ['tslint', 'typecheck', 'tsserver'],
  \   'javascript.jsx': ['eslint'],
  \   'rust': ['cargo'],
  \   'spec': [],
  \   'text': [],
  \   'sh': [],
  \   'zsh': ['shell']
\}

let g:ale_fixers = {
\   'python': [
\       'black',
\       'isort',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'hack': [
\       'hackfmt',
\   ],
\   'javascript': [
\       'prettier',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'javascript.jsx': [
\       'prettier',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'typescript': [
\	'prettier',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'typescript.tsx': [
\	'prettier',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'cpp': [
\       'clang-format',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'sh': [],
\   'cs': [
\       'uncrustify',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ]
\}

let g:ale_typescript_tslint_use_global = 0
" let g:ale_c_uncrustify_options = '-c ~/.uncrustify.cfg'
let g:ale_c_uncrustify_options = ''
let g:ale_history_log_output=1
set omnifunc=ale#completion#OmniFunc
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>"]
let g:ale_python_black_options="-l 80"
