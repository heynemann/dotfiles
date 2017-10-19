if [[ $platform == 'linux' ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
  alias mvim='gvim'
  alias apt-upgrade='sudo aptitude update -y && sudo aptitude safe-upgrade -y'
  alias ls="ls --color"
  alias ll="ls --color -lah"
fi

if [[ $platform == 'darwin' ]]; then
  alias ls="ls -G"
  alias ll="ls -lah"
fi

alias myip="ifconfig | grep --color=none -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep --color=none -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1"

alias aws-login='$(aws ecr get-login)'
alias docker-stop='echo "Stopping containers..." && docker stop $(docker ps -a -q) && echo "Removing containers..." && docker rm $(docker ps -a -q)'
alias docker-cleanup='docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes'
alias docker-clean='docker volume rm $(docker volume ls -qf dangling=true)'
alias docker-nuke='echo "Removing all docker images..." && docker rmi $(docker images -q)'
alias fis-stag='fission --server fission-stag.tfgco.com'
alias fis-prod='fission --server fission.tfgco.com'
alias random-commit='curl -s http://whatthecommit.com/ | grep --color=no "[<]p" | egrep -v permalink | sed "s@[<]p[>]\(.*\)@\1@"'
alias hit='wrk -c 30 -d 30 -t 10 --latency'

alias reload='exec zsh'

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

function rtime() {
    START=`python -c "import time; print(time.time())"`
    /bin/zsh -c "$1 $2 $3 $4 $5 $6 $7 $8 $9 $10"
    STATUS=$?
    python -c "import time; print('Operation took %.5fms.' % ((time.time() - float($START)) * 1000.0))"
    return STATUS
}

if ! exists pygmentize; then
    pip install pygments
fi

alias c='pygmentize -g -O style=colorful,linenos=1'
