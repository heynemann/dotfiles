prompt_last_tag(){
    local last_tag=$(git describe --abbrev=0 --tags 2> /dev/null)
    local color='%F{black}'
    if [ $last_tag ]; then
        echo -n "%{$color%} $(print_icon 'VCS_BOOKMARK_ICON')$last_tag%{%f%} "
    fi
}

prompt_due_tasks(){
  local today_tasks=$(task +TODAY count)
  local tomorrow_tasks=$(task +TOMORROW count)
  local today_color='%F{red}'
  local tomorrow_color='%F{red}'
  local text_color='%F{white}'
  local task_char='⚙'
  if [ $today_tasks != 0 ]; then
      echo -n "%{$today_color%}⛈ %{$text_color%}$today_tasks%{%f%} "
  fi

   if [ $tomorrow_tasks != 0 ]; then
      echo -n "%{$tomorrow_color%}⛅ %{$text_color%}$tomorrow_tasks%{%f%} "
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
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir due_tasks vcs last_tag)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_time nvm space virtualenv rvm time)
export POWERLEVEL9K_VCS_HIDE_TAGS=true
export POWERLEVEL9K_HIDE_BRANCH_ICON=false

export POWERLEVEL9K_OS_ICON_BACKGROUND="white"
export POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
export POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"