export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [[ $platform == 'darwin' ]]; then
    alias pyenv='CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv'
fi
