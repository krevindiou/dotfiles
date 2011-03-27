DOTFILES_DIR := $(shell pwd)

install: 
	@$(MAKE) backup
	@$(MAKE) install-oh-my-zsh
	@$(MAKE) install-vim
	@echo "==========================="
	@echo "| OK, NOW JUST RUN zsh :  |"
	@echo "| chsh -s /bin/zsh && zsh |"
	@echo "==========================="

backup:
	@echo "* config backup..."
	@mkdir -p ~/dotfiles_backup
	@if test -e ~/.zshrc; then \
		cp ~/.zshrc ~/dotfiles_backup/zshrc; \
	fi
	@if test -e ~/.vim; then \
		cp -Rf ~/.vim ~/dotfiles_backup/vim; \
	fi
	@if test -e ~/.vimrc; then \
		cp ~/.vimrc ~/dotfiles_backup/vimrc; \
	fi

install-oh-my-zsh:
	@echo "* zsh config..."
	@cp -Rf $(DOTFILES_DIR)/oh-my-zsh ~/.oh-my-zsh
	@cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
	@echo "export PATH=$$PATH" >> ~/.zshrc
	@# Theme update
	@sed -i 's/\"robbyrussell\"/\"gentoo\"/' ~/.zshrc
	@# Execute .zshrc
	@/bin/sh -c . ~/.zshrc

install-vim:
	@echo "* VIM config..."
	@mkdir -p ~/.vim
	@cp -Rf $(DOTFILES_DIR)/vip/.vim/* ~/.vim
	@cp -f $(DOTFILES_DIR)/vip/.vimrc ~
	@# Execute php-doc.vim
	@/bin/sh -c . ~/.vim/php-doc.vim

