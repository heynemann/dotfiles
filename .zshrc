export TERM="xterm-256color"
source ~/.antigen.zsh

export POWERLEVEL9K_MODE='awesome-patched'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm node_version virtualenv go_version aws time)

export POWERLEVEL9K_OS_ICON_BACKGROUND="white"
export POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
export POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

# Install oh-my-zsh
antigen bundle robbyrussell/oh-my-zsh lib/

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-extras
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting

# For SSH, starting ssh-agent is annoying
antigen bundle ssh-agent

# Node Plugins
antigen bundle coffee
antigen bundle node
antigen bundle npm
antigen bundle jsontools
antigen bundle lukechilds/zsh-nvm

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv
antigen bundle virtualenvwrapper

# Ruby Plugins
antigen bundle ruby
antigen bundle rvm

# Docker
antigen bundle docker

# Redis
antigen bundle redis-cli

# AWS
antigen bundle aws

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...
fi

# Load the theme.
#antigen theme juanghurtado
#antigen theme bureau
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell antigen that you're done.
antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
