#!/bin/bash

# assumed you have git, otherwise
# sudo apt-get install -y git-all git-core

# git setup 
# ssh-keygen -t rsa -b 4096 
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa
# ssh -T git@github.com

# Use cp everywhere to avoid symbolic links
cp $(readlink -f gitconfig) ~/.gitconfig
cp $(readlink -f gitignore) ~/.gitignore
cp $(readlink -f .vimrc) ~/.vimrc

# Handle zsh
sudo apt install -y zsh
chsh -s `which zsh`
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp klam.zsh-theme ~/.oh-my-zsh/themes/
cp $(readlink -f zshrc) ~/.zshrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp zshrc ~/.zshrc
# :PluginInstall

sudo apt install -y tree
# install postgres, redis, etc
