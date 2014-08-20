function link_opencv
	if not test -d /usr/local/Cellar/opencv/*/lib/python2.7/site-packages/
		set_color ff0000
		printf "Could not find any cv python binding files... Are you sure you have installed OpenCV properly?\n"
		printf "looked for opencv files at /usr/local/Cellar/opencv/*/lib/python2.7/site-packages\n"
		set_color normal
		return
	end
    if not test $VIRTUAL_ENV
		set_color ff0000
        printf "Could not find a suitable virtualenv to link opencv to...\n"
        printf "Have you activated a virtualenv?\n"
		set_color normal
        return
    end
	for file in (ls /usr/local/Cellar/opencv/*/lib/python2.7/site-packages/cv*)
        ln -s $file $VIRTUAL_ENV/lib/python*/site-packages/
	end
end
