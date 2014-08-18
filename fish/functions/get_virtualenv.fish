function get_virtualenv --description="Gets the current virtualenv and interpreter version"
    test -n "$VIRTUAL_ENV"; or return
    set -l pythonv (python -c 'import sys; print (".".join([str(item) for item in sys.version_info[:3]]))')
    set_color ff9000
    printf "+%s" (basename $VIRTUAL_ENV)
    printf "(%s) " $pythonv
    set_color normal
end

