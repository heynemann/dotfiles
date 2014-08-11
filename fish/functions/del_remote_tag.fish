function --description="Deletes the remote tag specified in $argv" del_remote_tag
	test -n "$argv"; or return
    git push origin :refs/tags/$argv
end
