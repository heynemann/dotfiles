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
	printf '[⌚ %s] ' (date "+%H:%M:%S")
	set_color normal

	# Show disk usage when low
	set -l du (df / | tail -n1 | sed "s/  */ /g" | cut -d' ' -f 5 | cut -d'%' -f1)
	if test $du -gt 80
			error du $du%%
	end

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

	set_color ff9000
	set -l rvm (rvm-prompt v g)
	printf "☠%s☠ " $rvm
	set_color normal

	echo

	printf '↪ '
	set_color normal

end
