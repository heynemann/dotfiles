sudo aptitude install git-core
cd ~
DEV_DIR="`pwd`/dev"
if [ ! -d "$DEV_DIR" ]; then
	mkdir -p $DEV_DIR
fi
DOTFILES_DIR="$DEV_DIR/dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
	git clone git@github.com:heynemann/dotfiles.git $DOTFILES_DIR
fi
cd $DOTFILES_DIR
make setup-ubuntu
source ~/.bashrc
