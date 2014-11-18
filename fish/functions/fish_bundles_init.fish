function fish_bundles_init --description="Initializes fish bundle paths and configurations"
    set -ex __fish_bundles_list
    . ~/.config/fish/bundles/functions_path.fish
    set -gx __fish_bundles_bundle_root_path /home/heynemann/.config/fish/bundles/fish-bundles/virtual-fish-bundle
    . /home/heynemann/.config/fish/bundles/fish-bundles/virtual-fish-bundle/config.fish
    set -ex __fish_bundles_bundle_root_path
end