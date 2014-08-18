# Path to your oh-my-fish.
set fish_path $HOME/.config/fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins rvm python

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

function fish_title;end

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

set -g VIRTUALFISH_COMPAT_ALIASES # uncomment for virtualenvwrapper-style commands
source $fish_function_path/virtual.fish
# optional plugins
source $fish_function_path/auto_activation.fish
source $fish_function_path/global_requirements.fish
source $fish_function_path/projects.fish

setenv EDITOR mvim
set fish_greeting

set -x GOPATH $HOME/dev/go
if test -d /usr/local/Cellar/go/1.2.1/libexec/bin
    set -gx PATH $PATH /usr/local/Cellar/go/1.2.1/libexec/bin $GOPATH/bin
end
if test -d /usr/lib/node_modules/bower/bin
    set -gx PATH /usr/lib/node_modules/bower/bin $PATH
end
set -gx PROJECT_HOME ~/dev

set -x PIP_REQUIRE_VIRTUALENV 1
set -x PIP_RESPECT_VIRTUALENV 1
set -x PIP_LOG_FILE '~/.cache/pip-log.txt'
set -x PIP_DOWNLOAD_CACHE '~/.cache/pip_cache'
if test $HOMEBREW
    set -x VIRTUALENVWRAPPER_PYTHON /usr/local/bin/python
end

set -gx fish_function_path $fish_function_path ~/.config/fish/bundles/functions/

fish_bundle "heynemann/git-support-fish-bundle"
