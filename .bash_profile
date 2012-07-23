export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH

# COLORS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
source ~/.ps1

function FULLPWD {
    pwd
}

function evil_git_dirty {
  $(git diff --no-ext-diff --quiet --exit-code)
  local dirty=$?
  if [ "$dirty" != "0" ]
  then
      echo "*"
  fi
}

function git_untracked {
  local untracked=$(git ls-files --others --exclude-standard|wc -l|sed 's# ##g')
  if [ "$untracked" != "0" ]
  then
      echo "|untracked:$untracked"
  fi
}

# Get the current git branch name (if available)
evil_git_prompt() {
  local ref=$(git symbolic-ref HEAD 2>/dev/null | sed 's#refs/heads/##g' \
    || git rev-parse HEAD 2>/dev/null | cut -c1-10 | sed 's#refs/heads/##g' \
  )

  if [ "$ref" != "" ]
  then
    echo " ($ref$(evil_git_dirty)$(git_untracked)) "
  fi
}

venv_prompt() {
  local ref=$(echo $VIRTUAL_ENV | sed s#$WORKON_HOME/##g)

  if [ "$ref" != "" ]
  then
    echo " $BIGreen($ref)$Color_Off"
  fi
}

rvm_prompt() {
  local version=$(rvm-prompt i v g)
  if [ "$version" != "" ]
  then
    echo " $BIYellow($version)$Color_Off "
  fi
}

ps1_update() {
    local separator=∴
    export PS1="$IBlack[\$(date +%H:%M)]$Color_Off$(venv_prompt)$(rvm_prompt)$(FULLPWD)$Cyan$(evil_git_prompt)$Color_Off\n $IRed$separator$Color_Off "
    export PS2="> "
}
PROMPT_COMMAND="ps1_update"

ulimit -n 2048

source "/Users/heynemann/.rvm/scripts/rvm"  # This loads RVM into a shell session.

#export EDITOR='mvim -f'
#export PATH=$PATH:/usr/local/sbin

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# GIT BASH COMPLETION
source /usr/local/etc/bash_completion.d/git-completion.bash

#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local:/usr/local/lib:$DYLD_FALLBACK_LIBRARY _PATH

alias ipip='pip install --extra-index-url="http://ipypi.globoi.com" --extra-index-url="http://pypi.globoi.com"'

export WORKON_HOME=~/.virtualenvs
source $(which virtualenvwrapper.sh)

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

#export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME


