export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

eval "$(pyenv init -)"

#start-pyenv() {
    ##unset -f pyenv
    #export PATH="~/.pyenv/bin:$PATH"
    #eval "$(pyenv init -)"
    #eval "$(pyenv virtualenv-init -)"
    ##pyenv $@
#}
#
