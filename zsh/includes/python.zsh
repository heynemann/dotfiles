source <(pip completion --zsh)
source `which virtualenvwrapper.sh`

# https://github.com/wkentaro/pycd
type pycd.sh &>/dev/null && source `which pycd.sh`

# Python
export VIRTUALENV_USE_DISTRIBUTE=1

export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PATH=~/.pyenv/shims/:$PATH
