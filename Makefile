DOTFILES_DIR := $(shell pwd)
DATE := $(shell date +%Y%m%d_%H%M%S)
BACKUP_DIR := ~/dotfiles_backup/$(DATE)

install: 
	@$(MAKE) git-submodule
	@$(MAKE) backup
	@$(MAKE) install-oh-my-zsh
	@$(MAKE) install-vim
	@echo "==========================="
	@echo "| OK, NOW JUST RUN zsh :  |"
	@echo "| chsh -s /bin/zsh && zsh |"
	@echo "==========================="

git-submodule: 
	@echo "* Git submodule..."
	@git submodule init
	@git submodule update

backup:
	@echo "* config backup..."
	@mkdir -p $(BACKUP_DIR)
	@if test -e ~/.zshrc; then \
		cp ~/.zshrc $(BACKUP_DIR)/zshrc; \
	fi
	@if test -e ~/.vim; then \
		cp -Rf ~/.vim $(BACKUP_DIR)/vim; \
	fi
	@if test -e ~/.vimrc; then \
		cp ~/.vimrc $(BACKUP_DIR)/vimrc; \
	fi

install-oh-my-zsh:
	@echo "* zsh config..."
	@cp -Rf $(DOTFILES_DIR)/oh-my-zsh ~/.oh-my-zsh
	@cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
	@echo "export PATH=$$PATH" >> ~/.zshrc
	@# Theme update
	@sed -i 's/\"robbyrussell\"/\"agnoster\"/' ~/.zshrc
	@# Execute .zshrc
	@/bin/sh -c . ~/.zshrc

install-vim:
	@echo "* VIM config..."
	@rm -rf ~/.vim
	@mkdir ~/.vim
	@cp -Rf $(DOTFILES_DIR)/vim/* ~/.vim
	@cp -f $(DOTFILES_DIR)/vimrc ~/.vimrc
	@cd ~/.vim/bundle/Command-T && rake make && cd -

