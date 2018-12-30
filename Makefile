DOTFILES_DIR := $(shell pwd)
DATE := $(shell date +%Y%m%d_%H%M%S)
BACKUP_DIR := ~/dotfiles_backup/$(DATE)

install:
	@$(MAKE) git-submodule
	@$(MAKE) backup
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

install-vim:
	@echo "* VIM config..."
	@rm -rf ~/.vim
	@mkdir ~/.vim
	@cp -Rf $(DOTFILES_DIR)/vim/* ~/.vim
	@cp -f $(DOTFILES_DIR)/vimrc ~/.vimrc
	@cd ~/.vim/bundle/Command-T && rake make && cd -

