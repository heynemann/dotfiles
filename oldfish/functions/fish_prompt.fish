function fish_prompt --description 'Write out the prompt'

	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	if not set -q __fish_whoami
		set -g __fish_whoami (whoami)
	end

    # icons from:
	# http://panmental.de/symbols/info.htm

    printf '%s' (get_virtualenv)
    #printf '%s' (get_rvm)

	# PWD
	set_color $fish_color_cwd
	printf '%s' $__fish_whoami
	set_color 999999
	printf '@'
	set_color $fish_color_cwd
	#printf '%s' (prompt_pwd)
	set_color normal

    #printf '%s ' (__fish_git_prompt)
    #printf '%s' (get_last_tag)

	if not test $last_status -eq 0
		set_color $fish_color_error
	end

	echo

	set_color a90c0c
	printf ' ❄ '
	set_color normal

end

function fish_right_prompt -d "Write out the right prompt"
	# Date
	set_color 666666
	printf '[⌚ %s]' (date "+%H:%M:%S")
	set_color normal
end
