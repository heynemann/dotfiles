# General ZSH options

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

export GIT_EDITOR=vim
export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@8/bin:$PATH"

eval "$(starship init zsh)"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(brew --prefix)/lib
