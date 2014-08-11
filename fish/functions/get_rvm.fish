function get_rvm --description="Gets the current rvm gemset and ruby"
	set_color 67f867
	set -l rvm (rvm-prompt v g)
	printf "-%s " $rvm
	set_color normal
end

