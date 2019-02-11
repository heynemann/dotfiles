":autocmd BufWritePost test_*.py Pytest file

let g:jedi#popup_on_dot = 0

if has('nvim')
    if g:os == "Linux"
        let g:python2_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
        let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
    else
        if g:os == "Windows"
            let g:python2_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
            let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
        else
            let g:python2_host_prog = '/usr/local/bin/python'
            let g:python3_host_prog = '/usr/local/bin/python3'
        end
    end
end
