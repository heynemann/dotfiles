alias open="wslview"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -a"
alias ccat="bat"
alias gp="git push"
alias hit='wrk -c 30 -d 30 -t 10 --latency'


# Docker
alias docker-stop='echo "Stopping containers..." && docker stop $(docker ps -a -q) && echo "Removing containers..." && docker rm $(docker ps -a -q)'
alias docker-cleanup='docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes'
alias docker-clean='docker volume rm $(docker volume ls -qf dangling=true) && docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm'
alias docker-nuke='echo "Removing all docker images..." && docker rmi -f $(docker images -q)'
