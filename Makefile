setup bootstrap config: osx memcached brew git rvm python opencv htop mysql vbox symlinks
	@git submodule update --init

setup-ubuntu: apt git rvm python-ubuntu symlinks

apt:
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
	@CC=gcc sudo pip install --upgrade -r python-packages
	@CC=gcc sudo pip install -e "git+https://github.com/numpy/numpy.git#egg=numpy-dev"
	@echo ">>>>>>>>> PYTHON FINISHED <<<<<<<<<<"

python:
	@echo ">>>>>>>>>>>>> PYTHON <<<<<<<<<<<<<<<"
	@-brew install python --framework --universal
	@brew upgrade python --framework --universal
	@brew linkapps
	@cd /System/Library/Frameworks/Python.framework/Versions && sudo rm -f Current && sudo ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/Current
	@CC=gcc pip install --upgrade -r python-packages
	@CC=gcc pip install -e "git+https://github.com/numpy/numpy.git#egg=numpy-dev"
	@CC=gcc pip install -e "git+https://github.com/scipy/scipy#egg=scipy-dev"
	@CC=gcc pip install -e "git+https://github.com/matplotlib/matplotlib.git#egg=matplotlib-dev"
	
	@echo ">>>>>>>>> PYTHON FINISHED <<<<<<<<<<"
	@echo

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

symlinks:
	@rm -rf ~/.vim
	@ln -sf `pwd`/vim/.vim ~/.vim
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@ln -sf `pwd`/.bashrc ~/.bashrc
	@ln -sf `pwd`/.bash_profile ~/.bash_profile
	@ln -sf `pwd`/.ps1 ~/.ps1
	@ln -sf `pwd`/git-completion.bash ~/git-completion.bash
	@ln -sf `pwd`/virtualenv.ini ~/.virtualenvs/virtualenv.ini
