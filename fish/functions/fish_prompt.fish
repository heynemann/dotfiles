function fish_prompt --description 'Write out the prompt'

	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	if not set -q __fish_whoami
		set -g __fish_whoami (whoami)
	end

	# Date
	set_color 666666
	printf '[%s] ' (date "+%H:%M:%S")
	set_color normal

	# PWD
	set_color $fish_color_cwd
	printf '%s' $__fish_whoami
	set_color 999999
	printf '@'
	set_color $fish_color_cwd
	printf '%s' (pwd)
	set_color normal

	printf '%s ' (__fish_git_prompt)

	if not test $last_status -eq 0
		set_color $fish_color_error
	end

	# http://panmental.de/symbols/info.htm
	if test $VIRTUAL_ENV
		set_color ff9000
		printf "★%s★ " (basename $VIRTUAL_ENV)
		set_color normal
	end

	if test $RVM
		set_color ff9000
		printf "☠%s☠ " (basename $RVM)
		set_color normal
	end

	echo

	printf '↪ '
	set_color normal

end
