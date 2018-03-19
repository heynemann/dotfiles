" If you don't want help windows to be restored:
set sessionoptions-=help

" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers

" Don't persist options and mappings because it can corrupt sessions.
set sessionoptions-=options

let g:session_autosave='no'
