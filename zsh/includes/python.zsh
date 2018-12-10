# Python
export VIRTUALENV_USE_DISTRIBUTE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

# PIPSI
export PATH=~/.local/bin:$PATH

# venv
source `which virtualenvwrapper_lazy.sh`

if [[ $platform == "darwin" ]]; then
  export PYTHON_CONFIGURE_OPTS="--enable-framework"
fi
