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

# setup keyboard shortcuts
# http://unix.stackexchange.com/questions/119432/save-custom-keyboard-shortcuts-in-gnome, https://wiki.ubuntu.com/Keybindings, http://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/ubuntu-keybindings --output ~/ubuntu-keybindings
dconf load /org/gnome/desktop/wm/keybindings/ < ~/ubuntu-keybindings
rm ~/ubuntu-keybindings

# install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm install 2.1.2

# setup config files
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | ZSH=~/.oh-my-zsh sh
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/klam.zsh-theme --output $HOME/.oh-my-zsh/themes/klam.zsh-theme
chsh -s /bin/zsh 
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.gitconfig --output $HOME/.gitconfig
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.bashrc --output $HOME/.bashrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.vimrc --output $HOME/.vimrc
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.gemrc --output $HOME/.gemrc
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.zshrc --output $HOME/.zshrc

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
mkdir ~/golang
mkdir ~/golang/bin
mkdir ~/golang/pkg
mkdir -p ~/golang/src/github.com/kennyhlam
