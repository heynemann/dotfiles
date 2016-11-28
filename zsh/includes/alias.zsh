if [[ $platform == 'linux' ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

alias aws-login='$(aws ecr get-login)'
alias docker-stop='echo "Stopping containers..." && docker stop $(docker ps -a -q) && echo "Removing containers..." && docker rm $(docker ps -a -q)'
alias docker-nuke='echo "Removing all docker images..." && docker rmi $(docker images -q)'
