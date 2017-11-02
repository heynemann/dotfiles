export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

pyenv() {
    unset -f pyenv
    eval "$(pyenv init -)"
    pyenv $@
}
