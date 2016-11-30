source <(pip completion --zsh)
source /usr/local/bin/virtualenvwrapper.sh

# https://github.com/wkentaro/pycd
type pycd.sh &>/dev/null && source `which pycd.sh`

# Python
export VIRTUALENV_USE_DISTRIBUTE=1