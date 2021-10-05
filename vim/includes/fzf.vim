" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:fzf_buffers_jump = 1

"nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>
