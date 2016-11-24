export TERM="xterm-256color"

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'
fi

source "${HOME}/.zgen/zgen.zsh"

prompt_last_tag(){
    local last_tag=$(git describe --abbrev=0 --tags 2> /dev/null)
    local color='%F{black}'
    if [ $last_tag ]; then
        echo -n "%{$color%} $(print_icon 'VCS_BOOKMARK_ICON')$last_tag%{%f%} "
    fi
}

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export LAST_CMD_TIME="%F{cyan}${timer_show}s "
    unset timer
  fi
}

prompt_command_time(){
    echo -n $LAST_CMD_TIME
}

prompt_space(){
    echo -n " "
}

export POWERLEVEL9K_MODE='awesome-patched'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs last_tag)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_time node_version space virtualenv rvm time)
export POWERLEVEL9K_VCS_HIDE_TAGS=true
export POWERLEVEL9K_HIDE_BRANCH_ICON=true

export POWERLEVEL9K_OS_ICON_BACKGROUND="white"
export POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
export POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

# Install oh-my-zsh
## if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # Load the oh-my-zsh's library.
    zgen oh-my-zsh

    # Bundles from the default repo (robbyrussell's oh-my-zsh).
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/ssh-agent
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src

    # Node Plugins
    zgen oh-my-zsh plugins/coffee
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/jsontools
    zgen load lukechilds/zsh-nvm

    # Python Plugins
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/virtualenv
    zgen oh-my-zsh plugins/virtualenvwrapper

    # Ruby Plugins
    zgen oh-my-zsh plugins/ruby
    zgen oh-my-zsh plugins/rvm

    # Docker
    zgen oh-my-zsh plugins/docker

    # Redis
    zgen oh-my-zsh plugins/redis-cli

    # AWS
    zgen oh-my-zsh plugins/aws

    # OS specific plugins
    if [[ $CURRENT_OS == 'OS X' ]]; then
        zgen oh-my-zsh plugins/brew
        zgen oh-my-zsh plugins/brew-cask
        zgen oh-my-zsh plugins/gem
        zgen oh-my-zsh plugins/osx
    elif [[ $CURRENT_OS == 'Linux' ]]; then
        # None so far...
    fi

    # Load the theme.
    zgen load bhilburn/powerlevel9k powerlevel9k

    zgen save
fi

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

if [[ -d ~/Dropbox/dev/go ]]; then
  export GOPATH=~/Dropbox/dev/go
else
  export GOPATH=~/dev/go
fi
export PATH=$PATH:~/dev/go/bin

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "${HOME}/.zgen/zgen.zsh"

if [[ $platform == 'linux' ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

alias aws-login='$(aws ecr get-login)'
alias docker-stop='echo "Stopping containers..." && docker stop $(docker ps -a -q) && echo "Removing containers..." && docker rm $(docker ps -a -q)'
alias docker-nuke='echo "Removing all docker images..." && docker rmi $(docker images -q)'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.profile
if [[ $platform == 'darwin' ]]; then
  source `brew --prefix`/etc/profile.d/z.sh
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
