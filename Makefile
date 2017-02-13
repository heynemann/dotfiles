.PHONY: vim zsh

OS:=$(shell uname -s)

setup bootstrap config: osx memcached brew git pythonbrew rvm python opencv htop mysql vbox symlinks

apt:
	@sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable
	@sudo aptitude update
	@sudo aptitude safe-upgrade -y
	@cat ubuntu-packages.apt | xargs sudo aptitude install -y

memcached:
	@echo ">>>>>>>>>>>>> MEMCACHED <<<<<<<<<<<<<<<"
	@brew update
	@-brew uninstall -y libev
	@-brew install libevent
	@brew link libevent
	@-brew install memcached
	@-brew install libmemcached
	@-brew upgrade memcached
	@-brew upgrade libmemcached
	@brew unlink libevent
	@brew linkapps
	@echo ">>>>>>>>> MEMCACHED FINISHED <<<<<<<<<<"
	@echo

brew:
	@echo ">>>>>>>>>>>>> BREW <<<<<<<<<<<<<<<"
	@brew update
	@-cat brew-packages | xargs brew install
	@-cat brew-packages | xargs brew upgrade
	@brew linkapps
	@echo ">>>>>>>>> BREW FINISHED <<<<<<<<<<"
	@echo

vbox:
	@echo ">>>>>>>>>>>>> VBox <<<<<<<<<<<<<<<"
	@if [ ! -f /usr/bin/VBoxManage ]; then rm -rf /tmp/vboxinstall && mkdir -p /tmp/vboxinstall && cd /tmp/vboxinstall && wget http://download.virtualbox.org/virtualbox/4.2.0/$(shell curl -s http://download.virtualbox.org/virtualbox/4.2.0/ | egrep -i osx | sed "s#[<]A HREF\=\"##" | sed "s#\" NAME.*##" | tail -n1) && hdiutil attach VirtualBox-*.dmg && sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /Volumes/HD && hdiutil detach /Volumes/VirtualBox && wget http://download.virtualbox.org/virtualbox/4.2.0/$(curl -s http://download.virtualbox.org/virtualbox/4.2.0/ | egrep -i Oracle_VM_VirtualBox_Extension_Pack | sed "s#[<]A HREF\=\"##" | sed "s#\" NAME.*##" | tail -n1) && VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack* ; fi
	@if [ -f /usr/bin/VBoxManage ]; then echo 'VBox already installed. Skipping...' ; fi
	@echo ">>>>>>>>> VBox FINISHED <<<<<<<<<<"
	@echo

htop:
	@sudo chown root:wheel /usr/local/Cellar/htop-osx/0.8.2/bin/htop && sudo chmod u+s /usr/local/Cellar/htop-osx/0.8.2/bin/htop

git:
	@git config --global user.name "Bernardo Heynemann"
	@git config --global user.email heynemann@gmail.com
	@git config --global color.diff auto
	@git config --global color.status auto
	@git config --global color.branch auto

rvm:
	@echo ">>>>>>>>>>>>> RVM <<<<<<<<<<<<<<<"
	@if [ ! -f ~/.rvm/bin/rvm ]; then curl -L https://get.rvm.io | bash -s stable --ruby; fi
	@if [ -f ~/.rvm/bin/rvm ]; then echo 'RVM already installed. Skipping...' ; fi
	@echo ">>>>>>>>> RVM FINISHED <<<<<<<<<<"
	@echo

python-ubuntu:
	@echo ">>>>>>>>>>>>> PYTHON <<<<<<<<<<<<<<<"
	@sudo aptitude install python2.7-dev python-pip -y
	@CC=gcc sudo pip install --upgrade pip
	@CC=gcc sudo pip install --upgrade -r python-packages
	@mkdir -p ~/.config
	@cp ./pep8 ~/.config
	@echo ">>>>>>>>> PYTHON FINISHED <<<<<<<<<<"

pyenv:
	@cd ~ && if [ ! -d ~/.pyenv ]; then git clone git://github.com/yyuu/pyenv.git .pyenv; fi
	@pyenv install 2.7.13
	@pyenv install 3.5.2
	@pyenv install 3.6.0
	@pyenv install pypy-2.2

python:
	@echo ">>>>>>>>>>>>> PYTHON <<<<<<<<<<<<<<<"
	@-brew install python --framework --universal
	@brew upgrade python --framework --universal
	@brew linkapps
	@cd /System/Library/Frameworks/Python.framework/Versions && sudo rm -f Current && sudo ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/Current
	@CC=gcc sudo pip install --upgrade pip
	@CC=gcc pip install --upgrade -r python-packages
	@CC=gcc pip install -e "git+https://github.com/numpy/numpy.git#egg=numpy-dev"
	@CC=gcc pip install -e "git+https://github.com/scipy/scipy#egg=scipy-dev"
	@CC=gcc pip install -e "git+https://github.com/matplotlib/matplotlib.git#egg=matplotlib-dev"
	@mkdir -p ~/.config
	@cp ./pep8 ~/.config
	@cp ./flake8 ~/.config

	@echo ">>>>>>>>> PYTHON FINISHED <<<<<<<<<<"
	@echo

pythonbrew:
	@if [ ! -d "$$HOME/.pythonbrew" ]; then curl -kL http://xrl.us/pythonbrewinstall | bash; fi
	@-[[ -s "$$HOME/.pythonbrew/etc/bashrc" ]] && source "$$HOME/.pythonbrew/etc/bashrc"
	@pythonbrew install 2.5.6
	@pythonbrew install 2.6.8
	@pythonbrew install 2.7.3
	@pythonbrew install 3.0.1
	@pythonbrew install 3.1.4
	@pythonbrew install 3.2.3
	@pythonbrew install 3.3.0

opencv:
	@echo ">>>>>>>>>>>>> OpenCV <<<<<<<<<<<<<<<"
	@-brew install opencv
	@-brew upgrade opencv
	@brew linkapps
	@echo ">>>>>>>>> OpenCV FINISHED <<<<<<<<<<"
	@echo

osx:
	@echo ">>>>>>>>>>>>> OSX <<<<<<<<<<<<<<<"
	@if [ ! -f ~/.has_sourced_osx ]; then source `pwd`/.osx; fi
	@if [ -f ~/.has_sourced_osx ]; then echo 'Already configured MAC OS X. Skipping...' ; fi
	@touch ~/.has_sourced_osx
	@echo ">>>>>>>>> OSX FINISHED <<<<<<<<<<"
	@echo

mysql:
	@echo ">>>>>>>>>>>>> mySQL <<<<<<<<<<<<<<<"
	@if [ ! -f ~/.has_configured_mysql ]; then unset TMPDIR && mysql_install_db --verbose --user=`whoami` --basedir="`brew --prefix mysql`" --datadir=/usr/local/var/mysql --tmpdir=/tmp && mkdir -p ~/Library/LaunchAgents && cp /usr/local/Cellar/mysql/5.*/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/ && launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist ; fi
	@if [ -f ~/.has_configured_mysql ]; then echo 'Already configured mySQL. Skipping...' ; fi
	@touch ~/.has_configured_mysql
	@echo ">>>>>>>>> mySQL FINISHED <<<<<<<<<<"
	@echo

postgresql:
	@echo "Please enter postgres default password:"
	@sudo -u postgres psql postgres -c "\password postgres"
	@sudo cp ./pg_hba.conf /etc/postgresql/*/main/pg_hba.conf
	@sudo /etc/init.d/postgresql restart

symlinks:
	@mkdir -p ~/.virtualenvs
	@rm -rf ~/.vim
	@ln -sf `pwd`/vim ~/.vim
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@ln -sf `pwd`/.bashrc ~/.bashrc
	@ln -sf `pwd`/.bash_profile ~/.bash_profile
	@ln -sf `pwd`/.ps1 ~/.ps1
	@ln -sf `pwd`/git-completion.bash ~/git-completion.bash
	@ln -sf `pwd`/virtualenv.ini ~/.virtualenvs/virtualenv.ini
	@ln -sf `pwd`/flake8 ~/.config/flake8
	@ln -sf `pwd`/pep8 ~/.config/pep8
	@ln -sf `pwd`/zsh ~/.zsh
	@ln -sf `pwd`/zsh/zsh_history ~/.zsh_history
	@ln -sf `pwd`/zsh/zshrc ~/.zshrc
	@ln -sf `pwd`/task/ ~/.task
	@ln -sf `pwd`/.taskrc ~/.taskrc
	#@ln -sf `pwd`/antigen.zsh ~/.antigen.zsh

vim:
	@mkdir -p ~/.fonts
	@cp fonts/* ~/.fonts

neobundle:
	@curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

update-virtual-fish:
	@rm -rf /tmp/virtualfish-master
	@cd /tmp && wget https://github.com/adambrenecki/virtualfish/archive/master.zip -O virtualfish.zip && unzip virtualfish.zip
	@cp /tmp/virtualfish-master/virtualfish/*.fish ./fish/functions/

update-oh-my-fish:
	@rm -rf /tmp/oh-my-fish*
	@cd /tmp && wget https://github.com/bpinto/oh-my-fish/archive/master.zip -O omf.zip && unzip omf.zip
	@cp -r /tmp/oh-my-fish* ./fish

fishlinks: update-virtual-fish update-oh-my-fish
	@rm -rf ~/.config/fish/
	@ln -s ~/dev/dotfiles/fish ~/.config/fish

basher:
	@if [ ! -d ~/.basher ]; then git clone https://github.com/basherpm/basher.git ~/.basher ; fi
	@cd ~/.basher && git reset --hard && git pull

fish-packages:
	@basher install heynemann/git-support-fish-bundle
	@basher install fish-bundles/virtual-fish-bundle

docker:
	@if [ ! -f /usr/bin/docker ]; then curl -sSL https://get.docker.com/ | sh ~/.basher ; fi
	@basher install bripkens/dock

update-fisher:
	@fish -c "fisher ls | fisher rm"
	@fish -c "fisher heynemann/theme-bobthefish edc/bass getopts nvm rvm z upto humanize_duration jaredculp/todo.fish"

update-dein:
	@curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/dein-installer.sh
	@sh /tmp/dein-installer.sh vim/dein

clear-vim-bundle:
	@rm -rf vim/bundle

vundle:
	@mkdir -p vim/vendor
	@rm -rf vim/vendor/Vundle.vim
	@git clone https://github.com/VundleVim/Vundle.vim.git vim/vendor/Vundle.vim
	@mkdir -p vim/bundle
	@rm -rf vim/bundle/Vundle.vim
	@ln -sf ~/.vim/vendor/Vundle.vim ~/.vim/bundle/Vundle.vim

install-vundle-plugins:
	@vim +PluginInstall +qall

update-vundle-plugins:
	@vim +PluginUpdate +qall

compile-ycm:
	@cd vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py --gocode-complete --tern-completer

vim: clear-vim-bundle vundle install-vundle-plugins compile-ycm

zsh:
	@chsh -s /bin/zsh
	@rm -rf "${HOME}/.zgen"
	@git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

antibody:
	@curl -sL https://git.io/antibody | bash -s

antibody-bundles:
	@echo "Don't forget to install percol (pip install percol)"
	@antibody bundle < ./zsh/includes/bundles.txt > ./zsh/includes/bundles.zsh
	@antibody bundle < ./zsh/includes/last-bundles.txt > ./zsh/includes/last-bundles.zsh

install-python-extensions:
	@bash -lc "if [ '${OS}' == 'Linux' ]; then sudo pip install -r ./pip-requirements.txt; fi"
	@bash -lc "if [ '${OS}' == 'Darwin' ]; then pip install -r ./pip-requirements.txt; fi"

nodejs:
	@curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
	@sudo apt-get install -y nodejs
	@curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

setup-ubuntu: apt nodejs git symlinks zsh antibody install-python-extensions antibody-bundles clear-vim-bundle vundle install-vundle-plugins compile-ycm pyenv
