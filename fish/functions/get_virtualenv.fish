function get_virtualenv
	test -n "$VIRTUAL_ENV"; or return
    set_color ff9000
    printf "+%s " (basename $VIRTUAL_ENV)
    set_color normal
end

