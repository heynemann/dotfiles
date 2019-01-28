export TERM="xterm-256color"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

_has() {
  return $( whence $1 >/dev/null )
}

# grep
if [ "$(uname)" = "Darwin" ]; then
  export PATH="/usr/local/bin:$PATH"
  export GREP_OPTIONS='--color=always'
  export GREP_COLOR='1;35;40'
fi

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'
fi

if [[ "`uname -a | grep Microsoft`" != "" ]]; then
   platform='windows'
fi

if [[ $platform == 'darwin' ]]; then
  export CLICOLOR=1
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi

if [[ $platform == 'Linux' ]]; then
  eval `dircolors $HOME/.zsh/dircolors.ansi-dark`
fi

fpath=(~/.zsh/completion $fpath)
fpath+=~/.zsh/zfunc

## completion
## https://carlosbecker.com/posts/speeding-up-zsh/
autoload -Uz compinit
if [[ $platform == 'darwin' ]]; then
  if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
    compinit -i
  else
    compinit -i -C
  fi
fi

if [[ $platform == "windows" ]]; then
  #if [ $(date +'%j') != $(date -r ~/.zcompdump +'%j') ]; then
  compinit -u
  #else
    #compinit -u
  #fi
fi

if [[ $platform == "linux" ]]; then
  compinit -i
fi

setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt interactive_comments
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt
setopt print_eight_bit
setopt extended_glob
# setopt globdots  # enable completion for dotfiles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

## add color
autoload colors
colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# history option
###############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed
setopt hist_ignore_dups
setopt hist_ignore_space
setopt histignorealldups

setopt list_packed
setopt pushd_ignore_dups

# no beep
setopt nolistbeep
setopt nobeep

## auto cd
setopt auto_cd
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' ignore-parents parent pwd

## By default, zsh considers many characters part of a word (e.g., _ and -).
## Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_141.jdk/Contents/Home"

f () {
    TF_PREVIOUS=$(fc -ln -1 | tail -n 1);
    TF_CMD=$(
        TF_ALIAS=f
        TF_SHELL_ALIASES=$(alias)
        PYTHONIOENCODING=utf-8
        thefuck $TF_PREVIOUS THEFUCK_ARGUMENT_PLACEHOLDER $*
    ) && eval $TF_CMD;
    test -n "$TF_CMD" && print -s $TF_CMD
}

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

TIPZ_TEXT='💡 '
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_DIR_TRUNC=0
SPACESHIP_VENV_SYMBOL="🐍"
SPACESHIP_DOCKER_SYMBOL="🐳"
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_PYENV_SHOW=false
SPACESHIP_VENV_COLOR=green
