SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_DIR_TRUNC=0
SPACESHIP_VENV_SYMBOL="🐍"
SPACESHIP_NODE_SYMBOL="⬢"
SPACESHIP_DOCKER_SYMBOL="🐳"
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_PYENV_SHOW=false
SPACESHIP_VENV_COLOR=green
SPACESHIP_PACKAGE_SYMBOL="📦"
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_DOCKER_SHOW=false

#
# Last Tag

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_LAST_TAG_SHOW="${SPACESHIP_LAST_TAG_SHOW=true}"
SPACESHIP_LAST_TAG_PREFIX="${SPACESHIP_LAST_TAG_PREFIX="at "}"
SPACESHIP_LAST_TAG_SUFFIX="${SPACESHIP_LAST_TAG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_LAST_TAG_SYMBOL="${SPACESHIP_LAST_TAG_SYMBOL="🔖"}"
SPACESHIP_LAST_TAG_COLOR="${SPACESHIP_LAST_TAG_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show LAST_TAG status
spaceship_last_tag() {
  # If SPACESHIP_LAST_TAG_SHOW is false, don't show LAST_TAG section
  [[ $SPACESHIP_LAST_TAG_SHOW == false ]] && return

  # Check if LAST_TAG command is available for execution
  spaceship::exists git || return

  # Check if git repo, otherwise return
  spaceship::is_git || return

  # Use quotes around unassigned local variables to prevent
  # getting replaced by global aliases
  # http://zsh.sourceforge.net/Doc/Release/Shell-Grammar.html#Aliasing
  local 'last_tag_status'
  last_tag_status=$(git for-each-ref --format='%(*committerdate:raw)%(committerdate:raw) %(refname) %(*objectname) %(objectname)' refs/tags 2>/dev/null | sort -n | awk '{ print $3 }' | tail -n1 | sed s@refs/tags/@@g)

  # Exit section if variable is empty
  [[ -z $last_tag_status ]] && return

  # Display LAST_TAG section
  spaceship::section \
    "$SPACESHIP_LAST_TAG_COLOR" \
    "$SPACESHIP_LAST_TAG_PREFIX" \
    "$SPACESHIP_LAST_TAG_SYMBOL$last_tag_status" \
    "$SPACESHIP_LAST_TAG_SUFFIX"
}

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  last_tag      # Custom git last tag
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
