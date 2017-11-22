" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'autopep8', 'yapf']
let g:ale_fix_on_save = 1
