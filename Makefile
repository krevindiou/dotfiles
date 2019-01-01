DOTFILES_DIR := $(shell pwd)
DATE := $(shell date +%Y%m%d_%H%M%S)
BACKUP_DIR := ~/dotfiles_backup/$(DATE)

install:
	@$(MAKE) backup
	@$(MAKE) install-bash-it
	@$(MAKE) install-vim

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
	@cp -f $(DOTFILES_DIR)/vimrc ~/.vimrc
	@curl -fLo ~/.vim/colors/solarized.vim --create-dirs https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@vim -c 'PlugInstall' -c 'x!' -c 'x!'
