brew() {
    unset -f brew
    source `brew --prefix`/etc/profile.d/z.sh
    brew $@
}

if [[ $platform != 'darwin' ]]; then
    unset -f brew
fi
