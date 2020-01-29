#source `brew --prefix`/etc/profile.d/z.sh
export LINUXBREW_HOME="/home/linuxbrew/.linuxbrew";
export PATH="$LINUXBREW_HOME/bin:$PATH"
eval $($LINUXBREW_HOME/bin/brew shellenv)
