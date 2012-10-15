setup bootstrap config: osx memcached brew git rvm python opencv htop mysql symlinks
	@git submodule update --init

memcached:
	@echo ">>>>>>>>>>>>> MEMCACHED <<<<<<<<<<<<<<<"
	@brew update
	@-brew uninstall -y libev
	@-brew install libevent
	@brew link libevent
	@-brew install memcached
	@-brew upgrade memcached
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
