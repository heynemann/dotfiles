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
. $fish_function_path/virtual.fish
# optional plugins
. $fish_function_path/auto_activation.fish
. $fish_function_path/global_requirements.fish
. $fish_function_path/projects.fish

#. $fish_path/oh-my-fish/oh-my-fish.fish

setenv EDITOR vim
