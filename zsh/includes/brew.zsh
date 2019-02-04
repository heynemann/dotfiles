brew() {
    unset -f brew
    source `brew --prefix`/etc/profile.d/z.sh
    brew $@
}

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
