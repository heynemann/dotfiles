config: symlinks
	@git submodule update --init

symlinks:
	@ln -sf `pwd`/vim/.vim ~/.vim
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@ln -sf `pwd`/.bashrc ~/.bashrc
	@ln -sf `pwd`/.bash_profile ~/.bash_profile
	@ln -sf `pwd`/.bash_profile ~/.bash_profile
	@ln -sf `pwd`/git-completion.bash ~/git-completion.bash

bundles:
	@cd vim/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make
