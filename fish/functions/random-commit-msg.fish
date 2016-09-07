function random-commit-msg
	curl -s http://whatthecommit.com/ | grep '[<]p' | egrep -v permalink | sed "s@[<]p[>]\(.*\)@\1@"
end
