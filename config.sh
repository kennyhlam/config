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


sudo apt install -y dkms
# install CUDA
# https://askubuntu.com/questions/799184/how-can-i-install-cuda-on-ubuntu-16-04
# uninstall CUDA
# https://devtalk.nvidia.com/default/topic/994466/how-to-uninstall-cuda-toolkit-and-cudnn-under-linux-/
echo "export PATH=/usr/local/cuda/bin:$PATH" >> ~/.bashrc
echo "export PATH=/usr/local/cuda/bin:$PATH" >> ~/.zshrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.zshrc

# install CuDNN
# https://askubuntu.com/questions/767269/how-can-i-install-cudnn-on-ubuntu-16-04
