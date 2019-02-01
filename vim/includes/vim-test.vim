let test#strategy = "dispatch"
let g:dispatch_compilers = { 'jest': 'jest-cli' }
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'

nmap <silent> <leader>rr :TestFile<CR>
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>c :cclose<CR>
