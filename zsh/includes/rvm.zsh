export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

rvm() {
    unset -f rvm
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
    rvm $@
}
