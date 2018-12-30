DOTFILES_DIR := $(shell pwd)
DATE := $(shell date +%Y%m%d_%H%M%S)
BACKUP_DIR := ~/dotfiles_backup/$(DATE)

install:
	@$(MAKE) git-submodule
	@$(MAKE) backup
	@$(MAKE) install-bash-it
	@$(MAKE) install-vim

git-submodule:
	@echo "* Git submodule..."
	@git submodule init
	@git submodule update

backup:
	@echo "* config backup..."
	@mkdir -p $(BACKUP_DIR)
	@if test -e ~/.vim; then \
		cp -Rf ~/.vim $(BACKUP_DIR)/vim; \
	fi
	@if test -e ~/.vimrc; then \
		cp ~/.vimrc $(BACKUP_DIR)/vimrc; \
	fi

install-bash-it:
	@echo "* Bash it config..."
	@test -d ~/.bash_it || git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
	@~/.bash_it/install.sh --silent
	@bash -i -c 'bash-it enable alias git npm vagrant'
	@bash -i -c 'bash-it enable completion docker docker-compose git makefile npm nvm ssh tmux vagrant'
	@bash -i -c 'bash-it enable plugin powerline'
	@sed -i 's/''bobby''/''powerline''/' ~/.bashrc

install-vim:
	@echo "* VIM config..."
	@rm -rf ~/.vim
	@mkdir ~/.vim
	@cp -Rf $(DOTFILES_DIR)/vim/* ~/.vim
	@cp -f $(DOTFILES_DIR)/vimrc ~/.vimrc
	@cd ~/.vim/bundle/Command-T && rake make && cd -
