DOTFILES_DIR := $(shell pwd)
DATE := $(shell date +%Y%m%d_%H%M%S)
BACKUP_DIR := ~/dotfiles_backup/$(DATE)

install:
	@$(MAKE) backup
	@$(MAKE) install-bash-it
	@$(MAKE) install-vim
	@$(MAKE) install-git

backup:
	@echo "* config backup..."
	@mkdir -p $(BACKUP_DIR)
	test -e ~/.vim && cp -Rf ~/.vim $(BACKUP_DIR)/vim
	test -e ~/.vimrc && cp ~/.vimrc $(BACKUP_DIR)/.vimrc
	test -e ~/.gitignore_global && cp ~/.gitignore_global $(BACKUP_DIR)/.gitignore_global
	test -e ~/.gitconfig && cp ~/.gitconfig $(BACKUP_DIR)/.gitconfig
	test -e ~/.inputrc && cp ~/.inputrc $(BACKUP_DIR)/.inputrc

install-bash-it:
	@echo "* Bash it config..."
	@test -d ~/.bash_it || git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
	@~/.bash_it/install.sh --silent
	@bash -i -c 'bash-it enable alias git npm vagrant'
	@bash -i -c 'bash-it enable completion docker docker-compose git makefile npm nvm ssh tmux vagrant'
	@bash -i -c 'bash-it enable plugin powerline nvm'
	@sed -i 's/''bobby''/''powerline''/' ~/.bashrc

install-vim:
	@echo "* VIM config..."
	@rm -rf ~/.vim
	@mkdir ~/.vim
	@cp -f $(DOTFILES_DIR)/.vimrc ~/.vimrc
	@curl -fLo ~/.vim/colors/solarized.vim --create-dirs https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@vim -c 'PlugInstall' -c 'x!' -c 'x!'

install-git:
	@echo "* Git config..."
	@cp -f $(DOTFILES_DIR)/.gitignore_global ~/.gitignore_global
	@cp -f $(DOTFILES_DIR)/.gitconfig ~/.gitconfig
	@sudo curl -fLo /usr/local/bin/diff-so-fancy --create-dirs https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
	@sudo chmod +x /usr/local/bin/diff-so-fancy
