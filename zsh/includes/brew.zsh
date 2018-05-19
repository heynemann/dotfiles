brew() {
    unset -f brew
    source `brew --prefix`/etc/profile.d/z.sh
    brew $@
}
