# Python
export VIRTUALENV_USE_DISTRIBUTE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

# PIPSI
export PATH=~/.local/bin:$PATH

# Poetry
export PATH=~/.poetry/bin:$PATH

if [[ $platform == "darwin" ]]; then
  export PYTHON_CONFIGURE_OPTS="--enable-framework"
fi
