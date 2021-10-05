# Fix weird network issue in WSL 2
# The reason we have to do this frequently is because WSL\
# keeps overwriting resolv.conf
# https://askubuntu.com/questions/91543/apt-get-update-fails-to-fetch-files-temporary-failure-resolving-error
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null