source /usr/local/bin/virtualenvwrapper.sh

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

export PIP_VIRTUALENV_BASE=$WORKON_HOME

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/local/lib/node

export NODE_PATH=/usr/local/lib/node

export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages:$PYTHONPATH

function PWD {
pwd | awk -F\/ '{if (NF>4) print "...", $(NF-2), $(NF-1), $(NF); else if (NF>3) print $(NF-2),$(NF-1),$(NF); else if (NF>2) print $(NF-1),$(NF); else if (NF>1) print $(NF);}' | sed -e 's# #\/#g'
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
    echo " ($ref$(evil_git_dirty)$(evil_git_stash)$(evil_git_unmerged)$(evil_git_unpushed)$(git_untracked)) "
  fi
}

export PS1="$RED[\$(date +%H:%M)]$txtrst $LIGHTBLUE\u$txtrst@$LIGHTYELLOW\h $txtrst[/\$(PWD)] $LIGHTCYAN\$(evil_git_prompt)$txtrst \$ "
export PS2="> "

alias uuid="python -c 'from uuid import uuid4; import sys; sys.stdout.write(str(uuid4()))' | pbcopy"

export PYTHONPATH="/usr/local/lib/python2.6/site-packages/:$PYTHONPATH"