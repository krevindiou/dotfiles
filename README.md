Installation
============

    hash curl &>/dev/null || sudo aptitude install curl
    hash vim &>/dev/null || sudo aptitude install vim-nox
    hash make &>/dev/null || sudo aptitude install make
    hash php &>/dev/null || sudo aptitude install php7.2-cli

    git clone git://github.com/krevindiou/dotfiles.git dotfiles
    cd dotfiles
    make install
