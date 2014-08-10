function get_last_tag
    set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree --short HEAD ^/dev/null)
	test -n "$repo_info"; or return
    set -l last_tag (git for-each-ref --sort committerdate --format '%(refname)' refs/tags | sed s/refs[/]tags[/]//g | tr -d ' ' | tail -1)
    if test $last_tag
        set_color 008aff
        printf "✦%s✦ " $last_tag
        set_color normal
    else
        return
    end
end
