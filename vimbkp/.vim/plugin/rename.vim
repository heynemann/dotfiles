map  <Leader><Leader>r :call <SID>RefactRenamePlain()<CR>
vmap <Leader><Leader>r :call <SID>RefactRenameVisual()<CR>

function! s:RefactRenameVisual()
	let l:vmode = visualmode()
	if l:vmode ==# 'v'
		call s:RefactRename(1)
	else
		echo "Can't use in line or block mode."
	endif
endfunction

function! s:RefactRenamePlain()
	call s:RefactRename(0)
endfunction

function! s:RefactRename(mode)
	let l:oldname = ''

	if a:mode == 1
		let l:a_save = @a
		normal! gv"ay
		let l:oldname = @a
		let @a = a_save
	else
		let l:oldname = expand("<cword>")
	endif

	if strlen(l:oldname)<1
		echo "Nothing to replace."
		return
	endif

	let l:newname = s:RefactPrompt("Replace '" . l:oldname . "'")

	if strlen(l:newname)<1
		echo "No replacement text entered."
		return
	endif

	let l:safeoldname = substitute(l:oldname, "/", "\\\\/", "g")
	let l:safeoldname = substitute(l:safeoldname, '\', '\\\\',"g")

	if a:mode == 1
		execute ':%s/\V'.l:safeoldname.'/'.l:newname.'/g'
	elseif a:mode == 0
		execute ':%s/\V\<'.l:safeoldname.'\>/'.l:newname.'/g'
	endif
endfunction

function! s:RefactPrompt(prompt)
   if &term =~ 'gui'
      return inputdialog(a:prompt)
   else
      call inputsave()
      let l:rtn = input(a:prompt." (or return to cancel): ")
      call inputrestore()
      return l:rtn
   endif
endfunction
