setup bootstrap config: brew rvm symlinks
	@git submodule update --init

brew:
	@brew update
	@-cat brew-packages | xargs brew install
	@-cat brew-packages | xargs brew upgrade
	@brew linkapps

rvm:
	@curl -L https://get.rvm.io | bash -s stable --ruby

symlinks:
	@ln -sf `pwd`/vim/.vim ~/.vim
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@ln -sf `pwd`/.bashrc ~/.bashrc
	@ln -sf `pwd`/.bash_profile ~/.bash_profile
	@ln -sf `pwd`/.ps1 ~/.ps1
	@ln -sf `pwd`/git-completion.bash ~/git-completion.bash

bundles:
	@cd vim/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make
