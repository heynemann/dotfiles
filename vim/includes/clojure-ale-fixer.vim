function! FormatClojure(buffer) abort
  return {
      \   'command': 'lein cljfmt fix %t > /dev/null && cat %t'
      \}
endfunction

execute ale#fix#registry#Add('cljfmt', 'FormatClojure', ['clojure'], 'cljfmt for clojure')

" You can now use it in g:ale_fixers
" let g:ale_fixers = {
"   \ 'lua': ['luafmt']
"   }
