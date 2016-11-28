#antibody bundle robbyrussell/oh-my-zsh
source <(antibody init)
antibody bundle < ~/.zsh/includes/bundles.zsh
antibody bundle < ~/.zsh/includes/last-bundles.zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#zgen oh-my-zsh plugins/git
#zgen oh-my-zsh plugins/git-extras
#zgen oh-my-zsh plugins/sudo
#zgen oh-my-zsh plugins/command-not-found
#zgen oh-my-zsh plugins/common-aliases
#zgen oh-my-zsh plugins/ssh-agent
#zgen oh-my-zsh plugins/taskwarrior
#zgen load zsh-users/zsh-syntax-highlighting
#zgen load zsh-users/zsh-completions src

# Node Plugins
#zgen oh-my-zsh plugins/coffee
#zgen oh-my-zsh plugins/node
#zgen oh-my-zsh plugins/npm
#zgen oh-my-zsh plugins/jsontools
#zgen load lukechilds/zsh-nvm

# Python Plugins
#zgen oh-my-zsh plugins/pip
#zgen oh-my-zsh plugins/python
#zgen oh-my-zsh plugins/virtualenv
#zgen oh-my-zsh plugins/virtualenvwrapper

# Ruby Plugins
#zgen oh-my-zsh plugins/ruby
#zgen oh-my-zsh plugins/rvm

# Docker
#zgen oh-my-zsh plugins/docker

# Redis
#zgen oh-my-zsh plugins/redis-cli

# AWS
#zgen oh-my-zsh plugins/aws

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    #zgen oh-my-zsh plugins/brew
    #zgen oh-my-zsh plugins/brew-cask
    #zgen oh-my-zsh plugins/gem
    #zgen oh-my-zsh plugins/osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...
fi

# Load the theme.
#zgen load bhilburn/powerlevel9k powerlevel9k


