#!/bin/bash

# return if not ubuntu
if [ -f $(which lsb_release) ]; then
	exit 0
fi

# install base packages
sudo apt-get update
sudo apt-get install -y apache2 postgresql-9.3 git
sudo apt-get install -y nodejs npm libpq-dev vim
sudo apt-get install -y nautilus-open-terminal curl zsh
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get upgrade -y
# remove amazon cruft
sudo apt-get remove -y unity-webapps-common

# generate ssh keys
mkdir -p ~/.ssh
ssh-keygen -t rsa -f ~/.ssh/id_rsa

# setup workspaces, ubuntu only?
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2

# get relevant git config repo
mkdir -p ~/development
git clone git@github.com:kennyhlam/config.git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# setup keyboard shortcuts
## http://unix.stackexchange.com/questions/119432/save-custom-keyboard-shortcuts-in-gnome
## https://wiki.ubuntu.com/Keybindings
## http://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored
dconf load /org/gnome/desktop/wm/keybindings/ < ~/development/config/ubuntu-keybindings
# setup terminal settings
ln -sf ~/development/config/%gconf.xml ~/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml

# install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm install 2.1.2

# setup configs and associated files 
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | ZSH=~/.oh-my-zsh sh
ln -sf ~/development/config/klam.zsh-theme ~/.oh-my-zsh/themes/klam.zsh-theme
chsh -s /bin/zsh 
ln -sf ~/development/config/.gitconfig ~/.gitconfig
# ln -sf ~/development/config/.bashrc ~/.bashrc
ln -sf ~/development/config/.vimrc ~/.vimrc
ln -sf ~/development/config/.gemrc ~/.gemrc
ln -sf ~/development/config/.zshrc ~/.zshrc

# setup ruby
rvm use 2.1.2@rails415 --create --default
sudo gem install pg
sudo gem install faraday
sudo gem install thin
sudo gem install sinatra
sudo gem install jsonschema
sudo gem install rails -v 4.1.5
sudo gem install devise

# setup go
cd ~/Downloads
wget https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz
tar -xvzf go1.4.1.linux-amd64.tar.gz
sudo mv go /usr/local
mkdir ~/development/golang
mkdir ~/development/golang/bin
mkdir ~/development/golang/pkg
mkdir -p ~/development/golang/src/github.com/kennyhlam
