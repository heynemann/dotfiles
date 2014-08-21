function fish_bundles_init --description="Initializes fish bundle paths and configurations"
    set -ex __fish_bundles_list
    . ~/.config/fish/bundles/functions_path.fish
end