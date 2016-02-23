set fish_path $HOME/.config/fish

# Theme
set fish_theme robbyrussell

function fish_title
    if [ $_ = 'fish' ]
        echo (prompt_pwd)
    else
        echo $_
    end
end

set fish_color_error ff8a00

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_prompt_color_date red light

set -g __fish_git_prompt_color_dirtystate blue light
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

if test -d ~/.basher
  set basher ~/.basher/bin
  set -gx PATH $basher $PATH
  status --is-interactive; and . (basher init -|psub)
  set -gx fish_function_path $fish_function_path ~/.basher/cellar/bin/
end

# uncomment for virtualenvwrapper-style commands
set -g VIRTUALFISH_COMPAT_ALIASES
source $fish_path/functions/virtual.fish
# optional plugins
source $fish_path/functions/auto_activation.fish
source $fish_path/functions/global_requirements.fish
source $fish_path/functions/projects.fish

# setenv EDITOR vim
set fish_greeting

set -x GOPATH $HOME/dev/go
if test -d /usr/local/Cellar/go/1.3.3/libexec/bin
    set -gx PATH $PATH /usr/local/Cellar/go/1.3.3/libexec/bin $GOPATH/bin
end

# node.js
if test -d /usr/lib/node_modules/bower/bin
    set -gx PATH /usr/lib/node_modules/bower/bin $PATH
end

if test -d /usr/lib/node_modules
    set -gx NODE_PATH /usr/lib/node_modules
end

set -gx PATH /usr/local/bin $PATH

# golang path
set -gx PATH $PATH /usr/local/Cellar/go/1.3.3/libexec/bin $GOPATH/bin
set -gx PROJECT_HOME ~/dev

# pip
set -x PIP_REQUIRE_VIRTUALENV 0
set -x PIP_RESPECT_VIRTUALENV 1
set -x PIP_LOG_FILE '~/.cache/pip-log.txt'
set -x PIP_DOWNLOAD_CACHE '~/.cache/pip_cache'
if test $HOMEBREW
    set -x VIRTUALENVWRAPPER_PYTHON /usr/local/bin/python
end

set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US.UTF-8"
set -x LARGEFONT "1"

# rvm path
set -gx PATH $HOME/.rvm/bin $PATH
rvm use 2.2.1

# LATEX
set -gx PATH /usr/local/texlive/2015/bin/x86_64-linux $PATH
