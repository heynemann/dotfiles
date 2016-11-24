" For Neomake
if split(getcwd(), "/")[-1] == 'brigade'
  let g:neomake_javascript_eslint_maker = {
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
          \ '%W%f: line %l\, col %c\, Warning - %m',
        \ 'exe': "./node_modules/.bin/eslint",
        \ 'args': ['-f', 'compact', '--rule', '{"no-console":[1]}'],
        \ }

  let g:neomake_ruby_rubocop_maker = {
        \ 'args': ['BUNDLE_GEMFILE=~/brigade/.overcommit_gems.rb', 'bundle', 'exec', 'rubocop'],
        \ 'exe': '/usr/bin/env',
        \ }

  let g:neomake_scss_scsslint_maker = {
        \ 'args': ['BUNDLE_GEMFILE=~/brigade/.overcommit_gems.rb', 'bundle', 'exec', 'scss-lint'],
        \ 'exe': '/usr/bin/env',
        \ 'errorformat': '%A%f:%l:%v [%t] %m,%A%f:%l [%t] %m',
        \ }

  let g:neomake_go_gobuild_maker = {
      \ 'exe': 'sh',
      \ 'args': ['-c', 'go build -o ' . neomake#utils#DevNull() . ' ./\$0', '%:h'],
      \ 'errorformat':
          \ '%W%f:%l: warning: %m,' .
          \ '%E%f:%l:%c:%m,' .
          \ '%E%f:%l:%m,' .
          \ '%C%\s%\+%m,' .
          \ '%-G#%.%#'
      \ }
endif

let g:neomake_list_height = 2     " this doesn't work but hopefully will someday
let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake
" get out of the the quickfix menu... there must be a discrepancy between
" vim/neovim in how the location lists are created
function SwitchBackIfInQuickfix()
  if &buftype == 'quickfix'
    wincmd p
    exe "norm! 6\<C-Y>"
  endif
endfunction
autocmd! User NeomakeFinished :call SwitchBackIfInQuickfix()
