# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

export PIP_REQUIRE_VIRTUALENV=false
export PIP_RESPECT_VIRTUALENV=true

export PIP_VIRTUALENV_BASE=$WORKON_HOME

function PWD {
pwd | awk -F\/ '{if (NF>4) print "...", $(NF-2), $(NF-1), $(NF); else if (NF>3) print $(NF-2),$(NF-1),$(NF); else if (NF>2) print $(NF-1),$(NF); else if (NF>1) print $(NF);}' | sed -e 's# #\/#g'
}

function FULLPWD {
    pwd
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
LIGHTBLUE="\[\033[1;34m\]"
LIGHTYELLOW="\[\033[1;33m\]"
LIGHTCYAN="\[\033[1;36m\]"

txtrst='\[\e[0m\]'    # Text Reset

source ~/git-completion.bash

# Git support functions for Evil Tomato
# Mohit Cheppudira <mohit@muthanna.com>

# Returns "*" if the current git branch is dirty.
function evil_git_dirty {
  [[ $(git diff --shortstat 2>/dev/null | tail -n1) != "" ]] && echo "*"
}

# Returns the number of untracked files.
function evil_git_num_untracked_files {
  expr `git status --porcelain 2>/dev/null| grep "^??" | wc -l`
}

# Returns the number of untracked files.
function evil_git_num_dirty_files {
  expr `git status --porcelain 2>/dev/null | egrep "^(M| M)" | wc -l`
}

# Returns "|shashed:N" where N is the number of stashed states (if any).
function evil_git_stash {
  local stash=`expr $(git stash list 2>/dev/null| wc -l)`
  if [ "$stash" != "0" ]
  then
    echo "|stashed:$stash"
  fi
}

# Returns "|unmerged:N" where N is the number of unmerged local and remote
# branches (if any).
function evil_git_unmerged {
  local unmerged=`expr $(git branch --no-color -a --no-merged | grep -v HEAD | wc -l)`
  if [ "$unmerged" != "0" ]
  then
    echo "|unmerged:$unmerged"
  fi
}

# Returns "|unpushed:N" where N is the number of unpushed local and remote
# branches (if any).
function evil_git_unpushed {
  local unpushed=`expr $( (git branch --no-color -r --contains HEAD; \
    git branch --no-color -r) | grep -v HEAD | sort | uniq -u | wc -l )`
  if [ "$unpushed" != "0" ]
  then
    echo "|unpushed:$unpushed"
  fi
}

function git_untracked {
  local untracked=`git status --porcelain 2>/dev/null | grep ^?? | wc -l | sed 's# ##g'`
  if [ "$untracked" != "0" ]
  then
      echo "|untracked:$untracked"
  fi
}

# Get the current git branch name (if available)
evil_git_prompt() {
  # local ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
  local ref=$(git branch 2>/dev/null | grep '^\*' | cut -b 3- | sed 's/[\(\)]//g')

  if [ "$ref" != "" ]
  then
    echo " ($ref$(evil_git_dirty)$(git_untracked)) "
  fi
}

venv_prompt() {
  local ref=$(echo $VIRTUAL_ENV | sed s#$WORKON_HOME/##g)

  if [ "$ref" != "" ]
  then
    echo " $LIGHTCYAN($ref)$txtrst"
  fi
}

rvm_prompt() {
  local version=$(rvm-prompt i v g)
  if [ "$version" != "" ]
  then
    echo " $LIGHTBLUE($version)$txtrst"
  fi
}

ps1_update() {
    export PS1="$RED[\$(date +%H:%M)]$txtrst$(venv_prompt)$(rvm_prompt)$txtrst $(FULLPWD)$LIGHTCYAN\$(evil_git_prompt)$txtrst \n $RED∴$txtrst "
    export PS2="> "
}


source /usr/local/bin/virtualenvwrapper.sh

export PATH=$PATH:/usr/lib/ruby/gems/1.8/gems
export PATH=$HOME/local/bin:$PATH
export NODE_PATH=~/local/lib/node_modules/

export EC2_KEYPAIR=heynemann
export EC2_URL=https://ec2.us-west-1.amazonaws.com
export EC2_PRIVATE_KEY=$HOME/Desktop/pk.pem
export EC2_CERT=$HOME/Desktop/cert.pem
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source ~/.rvm/scripts/rvm

PROMPT_COMMAND="ps1_update"

alias update-dotfiles="cd ~/dev/dotfiles && git stash && git pull --rebase && git stash apply"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
