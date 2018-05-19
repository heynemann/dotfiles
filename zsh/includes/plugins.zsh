ANTIBODY_CACHE_PATH="/home/heynemann/.cache"
[[ "$platform" == "darwin" ]] && ANTIBODY_CACHE_PATH="/Users/heynemann/Library/Caches"
export NVM_LAZY_LOAD=true

#echo 'Loading bundles...'
source ~/.zsh/includes/bundles.zsh

#echo 'Loading last bundles...'
source ~/.zsh/includes/last-bundles.zsh
