function get_rvm
	set_color 67f867
	set -l rvm (rvm-prompt v g)
	printf "-%s " $rvm
	set_color normal
end

