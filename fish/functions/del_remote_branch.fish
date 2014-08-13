function del_remote_branch --description 'Deletes the remote branch specified in /var/folders/mj/8vzkrj2j081fj5nn9pd2y1jm0000gn/T//fish_funced_15593_1195.fish'
	test -n "$argv"; or return
    git push --delete origin $argv
end
