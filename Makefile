.PHONY: setup

OS:=$(shell uname -s)
LINUXBREW:=/home/linuxbrew/.linuxbrew/bin
export PATH := ${LINUXBREW}:$(PATH)

setup:
	@echo "System Set Up for ${OS}"
	@echo "========================"
	@echo
ifeq ($(OS),Linux)
	@${MAKE} linux
else
	@${MAKE} darwin
endif

darwin:
	@echo "Not yet supported..."

linux: apt git linuxbrew fzf vim-setup zsh-setup pyenv

apt:
	@echo
	@echo "-----------------------------------"
	@echo "- Apt Packages Set Up             -"
	@echo "-----------------------------------"
	@echo
	@sudo apt-get update
	@sudo apt-get upgrade -y
	@echo "Installing build tools, git and curl..."
	@sudo apt-get install -y build-essential curl file git libffi-dev

git:
	@echo
	@echo "-----------------------------------"
	@echo "- Git Settings Set Up             -"
	@echo "-----------------------------------"
	@echo
	@git config --global user.name "Bernardo Heynemann"
	@git config --global user.email heynemann@gmail.com
	@git config --global color.diff auto
	@git config --global color.status auto
	@git config --global color.branch auto
	@git config --global core.editor "vim"

linuxbrew:
	@echo
	@echo "-----------------------------------"
	@echo "- Linuxbrew Set Up                -"
	@echo "-----------------------------------"
	@echo
	@CI=true sh -c "$$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

fzf:
	@echo
	@echo "-----------------------------------"
	@echo "- FZF Set Up                      -"
	@echo "-----------------------------------"
	@echo
	@-${LINUXBREW}/brew install fzf

vim-setup:
	@echo
	@echo "-----------------------------------"
	@echo "- VIM Set Up                      -"
	@echo "-----------------------------------"
	@echo
	@${LINUXBREW}/brew install vim
	@rm -f ~/.vim
	@rm -f ~/.vimrc
	@ln -s `pwd`/vim/ ~/.vim
	@ln -s `pwd`/vim/vimrc ~/.vimrc
	@touch ~/.extras.vim
	# @curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# @${LINUXBREW}/vim +PlugInstall +qall

zsh-setup:
	@echo
	@echo "-----------------------------------"
	@echo "- ZSH Set Up                      -"
	@echo "-----------------------------------"
	@echo
	@${LINUXBREW}/brew install zsh
	@rm -f ~/.zsh
	@rm -f ~/.zshrc
	@ln -s `pwd`/zsh/ ~/.zsh
	@ln -s `pwd`/zsh/zshrc ~/.zshrc
	@ln -sf `pwd`/zsh/zsh_history ~/.zsh_history
	@touch ~/.extras.zsh
	@grep -qxF "${LINUXBREW}/zsh" /etc/shells || sudo echo "${LINUXBREW}/zsh" >> /etc/shells
	@chsh -s ${LINUXBREW}/zsh
	@${MAKE} antybody

antibody:
	@curl -sL https://git.io/antibody | bash -s
	@./bin/antibody bundle < ./zsh/includes/bundles.txt > ./zsh/includes/bundles.zsh
	@sed -i.bak "s@${HOME}@~@g" ./zsh/includes/bundles.zsh
	@./bin/antibody bundle < ./zsh/includes/last-bundles.txt > ./zsh/includes/last-bundles.zsh
	@sed -i.bak "s@${HOME}@~@g" ./zsh/includes/last-bundles.zsh
	@rm -f ./zsh/includes/*.bak

pyenv:
	@echo
	@echo "-----------------------------------"
	@echo "- PyEnv Set Up                    -"
	@echo "-----------------------------------"
	@echo
	@sudo apt install -y zlib1g-dev
	@${LINUXBREW}/brew install pyenv
	@${LINUXBREW}/brew install pyenv-virtualenv
	@sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
	@pyenv --version
	@pyenv install -s 3.8.1
	@pyenv global 3.8.1
	
docker:
	@echo
	@echo "-----------------------------------"
	@echo "- Docker Set Up                   -"
	@echo "-----------------------------------"
	@echo
	@sudo apt install -y docker.io docker-compose
	@sudo systemctl start docker
	@echo "Creating docker user group..."
	@-sudo groupadd docker
	@echo "Adding ${USER} to docker user group..."
	@-sudo usermod -aG docker ${USER}
	@newgrp docker
