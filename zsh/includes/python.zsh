source `which virtualenvwrapper_lazy.sh`

#https://github.com/wkentaro/pycd
pycd() {
    unset -f pycd
    source `which pycd.sh`
    pycd $@
}

# Python
export VIRTUALENV_USE_DISTRIBUTE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
