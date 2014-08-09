setup bootstrap config: osx memcached brew git pythonbrew rvm python opencv htop mysql vbox symlinks
setup-ubuntu: apt git rvm python-ubuntu nodejs postgresql symlinks pythonbrew

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
	@CC=gcc sudo pip install --upgrade pip
	@CC=gcc sudo pip install --upgrade -r python-packages
	@mkdir -p ~/.config
	@cp ./pep8 ~/.config
	@echo ">>>>>>>>> PYTHON FINISHED <<<<<<<<<<"

pyenv:
	@cd ~ && if [ ! -d ~/.pyenv ]; then git clone git://github.com/yyuu/pyenv.git .pyenv; fi
	@pyenv install 2.7.6
	@pyenv install 3.3.3
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

nodejs:
	@echo ">>>>>>>>>>>>> NODE JS <<<<<<<<<<<<<<<"
	@sudo apt-get install python-software-properties python g++ make -y
	@sudo add-apt-repository ppa:chris-lea/node.js
	@sudo apt-get update
	@sudo apt-get install nodejs -y
	@echo ">>>>>>>>> NODE JS FINISHED <<<<<<<<<<"
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
	@ln -sf `pwd`/vim/.vim ~/.vim
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@ln -sf `pwd`/.bashrc ~/.bashrc
	@ln -sf `pwd`/.bash_profile ~/.bash_profile
	@ln -sf `pwd`/.ps1 ~/.ps1
	@ln -sf `pwd`/git-completion.bash ~/git-completion.bash
	@ln -sf `pwd`/virtualenv.ini ~/.virtualenvs/virtualenv.ini
	@ln -sf `pwd`/flake8 ~/.config/flake8
	@ln -sf `pwd`/pep8 ~/.config/pep8

vundle:
	@rm ~/.vim/bundle/vundle
	@ln -sf ~/.vim/vendor/vundle ~/.vim/bundle/vundle

update-virtual-fish:
	@rm -rf /tmp/virtualfish-master
	@cd /tmp && wget https://github.com/adambrenecki/virtualfish/archive/master.zip -O virtualfish.zip && unzip virtualfish.zip
	@cp /tmp/virtualfish-master/*.fish ./fish/functions/

fishlinks: update-virtual-fish
	@rm -rf ~/.config/fish/
	@ln -s ~/dev/dotfiles/fish ~/.config/fish
