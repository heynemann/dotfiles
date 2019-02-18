let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

" use tab to forward cycle
"inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
"inoremap <silent><expr><CR> pumvisible() ?
	"\ (deoplete#close_popup())
"\ : (delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "\<CR>")

inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Change clang binary path
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

" Change clang options
call deoplete#custom#var('clangx', 'default_cpp_options', '-std=c++14 -I./node_modules/node-addon-api/ -I~/$HOME/node-gyp/11.8.0/include/node/')

" CSharp Changes
call deoplete#custom#option('sources', {
    \ 'cs': ['omnisharp'],
    \})
