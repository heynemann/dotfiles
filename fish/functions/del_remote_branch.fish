function del_remote_branch --description 'Deletes the remote branch specified in argv'
	test -n "$argv"; or return
    git push --delete origin $argv
end
