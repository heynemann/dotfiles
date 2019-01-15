export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:"$HOME/.yarn/bin"

nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    nvm $@
}
