":autocmd BufWritePost test_*.py Pytest file

" let g:jedi#popup_on_dot = 0

" if has('nvim')
    " if g:os == "Linux"
        " let g:python2_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
        " let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
    " else
        " if g:os == "Windows"
            " let g:python2_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
            " let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
        " else
            " let g:python2_host_prog = '/usr/local/bin/python'
            " let g:python3_host_prog = '/usr/local/bin/python3'
        " end
    " end
" end

" let g:python_highlight_all = 1


function! PylintOpen()
  let l:rootpath = trim(system("git rev-parse --show-toplevel"))
  let l:module = trim(system("basename " . l:rootpath))
  echo "Running pylint... Please wait as this can take a long time."
  let l:command = "pylint " . l:module . " tests | grep '*** Module' | sed 's@\** Module @@g' | sed 's@[.]@/@g' | sed 's@$@.py@g'"
  let l:pylints = system(l:command)
  if l:pylints == ""
    echo "No lint errors found!"
    return
  endif
  let l:files = split(l:pylints, "\n")
  execute "args " . join(l:files, " ") . " | argdo tabe"
endfunction
nnoremap <silent> gk :call PylintOpen()<CR>
