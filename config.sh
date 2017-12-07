#!/bin/bash

# assumed you have git, otherwise
# sudo apt-get install -y git-all git-core

# git setup 
# ssh-keygen -t rsa -b 4096 
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa
# ssh -T git@github.com

ln -sf $(readlink -f .gitconfig) ~/.gitconfig
ln -sf $(readlink -f .vimrc) ~/.vimrc

sudo apt install -y zsh
chsh -s `which zsh`
ln -sf $(readlink -f .zshrc) ~/.zshrc
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp klam.zsh-theme ~/.oh-my-zsh/themes/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# :PluginInstall

sudo apt install -y tree
# install postgres, redis, etc
