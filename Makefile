setup bootstrap config: osx brew git rvm symlinks
	@git submodule update --init

brew:
	@echo ">>>>>>>>>>>>> BREW <<<<<<<<<<<<<<<"
	@brew update
	@-cat brew-packages | xargs brew install
	@-cat brew-packages | xargs brew upgrade
	@brew linkapps
	@echo ">>>>>>>>> BREW FINISHED <<<<<<<<<<"
	@echo

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

osx:
	@echo ">>>>>>>>>>>>> OSX <<<<<<<<<<<<<<<"
	@if [ ! -f ~/.has_sourced_osx ]; then source `pwd`/.osx; fi
	@if [ -f ~/.has_sourced_osx ]; then echo 'Already configured MAC OS X. Skipping...' ; fi
	@touch ~/.has_sourced_osx
	@echo ">>>>>>>>> OSX FINISHED <<<<<<<<<<"
	@echo

symlinks:
	@rm -rf ~/.vim
	@ln -sf `pwd`/vim/.vim ~/.vim
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@ln -sf `pwd`/.bashrc ~/.bashrc
	@ln -sf `pwd`/.bash_profile ~/.bash_profile
	@ln -sf `pwd`/.ps1 ~/.ps1
	@ln -sf `pwd`/git-completion.bash ~/git-completion.bash
