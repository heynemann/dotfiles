export PATH=$PATH:/usr/local/bin:/usr/local/sbin
export PATH=$PATH:/usr/local/share/npm/bin

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall

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

function git_tag {
  local tags=$(git for-each-ref --sort committerdate --format '%(refname)' refs/tags| sed s#refs/tags/## | tr -d ' ' | tail -1)
  if [ "$tags" != "" ]
  then
      echo "|last-tag:$tags"
  fi
}

# Get the current git branch name (if available)
evil_git_prompt() {
  local ref=$(git symbolic-ref HEAD 2>/dev/null | sed 's#refs/heads/##g' \
    || git rev-parse HEAD 2>/dev/null | cut -c1-10 | sed 's#refs/heads/##g' \
  )

  if [ "$ref" != "" ]
  then
    echo " $ref$(evil_git_dirty)$(git_untracked)$(git_tag) "
  fi
}

venv_prompt() {
  local ref=$(echo $VIRTUAL_ENV | sed s#$WORKON_HOME/##g | sed s#$PYENV_ROOT/versions/##)
  local pythonv=$(python -c 'import sys; print (".".join([str(item) for item in sys.version_info[:3]]))')

  if [ "$ref" != "" ]
  then
    echo " $BIGreen#$ref ($pythonv)$Color_Off"
  fi
}

rvm_prompt() {
  local version=$(rvm-prompt i v g)
  if [ "$version" != "" ]
  then
    echo " $BIYellow@$version$Color_Off "
  fi
}

ps1_update() {
    local separator=∴
    export PS1="$IBlack[\$(date +%H:%M)]$Color_Off$(venv_prompt)$(rvm_prompt)$(FULLPWD)$Cyan$(evil_git_prompt)$Color_Off\n $IRed$separator$Color_Off "
    export PS2="> "
}
PROMPT_COMMAND="ps1_update"

ulimit -n 2048

export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages/

# Make vim the default editor
export EDITOR="mvim -f"
# Highlight section titles in manual pages
#export LESS_TERMCAP_md="$Cyan"

export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE=""
shopt -s histappend

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# GIT BASH COMPLETION
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local:/usr/local/lib:$DYLD_FALLBACK_LIBRARY _PATH

alias ipip='pip install --index-url="http://pypi.globoi.com/proxy" --extra-index-url="http://ipypi.globoi.com" --extra-index-url="http://pypi.globoi.com"'
alias glb-update='mkdir -p ~/Desktop/glb07/2014; mkdir -p /Volumes/_criacao && mount -t smbfs "//corp.globoi.com;bernardo@fileserver.corp.globoi.com/_criacao" /Volumes/_criacao; rsync -rax --progress --exclude="*.key" --exclude="/.gvfs" /Volumes/_criacao/00_padroes/04_projetos/17_HOME_GCOM/2014/ux/ ~/Desktop/glb07/2014/ux'
alias holmes-update='mkdir -p ~/Desktop/glb07/holmes; mkdir -p /Volumes/_criacao_holmes && mount -t smbfs "//corp.globoi.com;bernardo@fileserver.corp.globoi.com/_criacao" /Volumes/_criacao_holmes; rsync -rax --progress --exclude="*.key" --exclude="/.gvfs" /Volumes/_criacao_holmes/00_padroes/04_projetos/Holmes ~/Desktop/glb07/holmes'
alias update-dev='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'

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

export PIP_REQUIRE_VIRTUALENV=false
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

alias release_ipypi='python setup.py sdist upload -r ipypi'
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
. `brew --prefix`/etc/profile.d/z.sh
source /usr/local/opt/autoenv/activate.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi
