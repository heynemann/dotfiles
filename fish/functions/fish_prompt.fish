function fish_prompt --description 'Write out the prompt'

	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# Date
	set_color 666666
	printf '[%s] ' (date "+%H:%M:%S")
	set_color normal

	# PWD
	set_color $fish_color_cwd
	echo -n (pwd)
	set_color normal

	printf '%s ' (__fish_git_prompt)

	if not test $last_status -eq 0
		set_color $fish_color_error
	end

	echo
	if test $VIRTUAL_ENV
		printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
	end
	printf '↪ '
	set_color normal

end
