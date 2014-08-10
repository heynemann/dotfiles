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

    printf '%s' (__fish_git_prompt)

    set -l last_tag (git for-each-ref --sort committerdate --format '%(refname)' refs/tags | sed s/refs[/]tags[/]//g | tr -d ' ' | tail -1)
    if test $last_tag
        set_color 008aff
        printf " ✦%s✦ " $last_tag
        set_color normal
    else
        printf " "
    end

	if not test $last_status -eq 0
		set_color $fish_color_error
	end

	# http://panmental.de/symbols/info.htm
	if test $VIRTUAL_ENV
		set_color ff9000
		printf "★%s★ " (basename $VIRTUAL_ENV)
		set_color normal
	end

	set_color 67f867
	set -l rvm (rvm-prompt v g)
	printf "☠%s☠ " $rvm
	set_color normal

	echo

	set_color a90c0c
	printf ' ❄ '
	set_color normal

end
