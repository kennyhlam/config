#!/bin/bash

if [ -f $(which lsb_release) ]; then
	exit 0
fi

sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install -y postgresql-9.3
sudo apt-get install -y git
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y libpq-dev
sudo apt-get install -y vim
sudo apt-get install -y nautilus-open-terminal
sudo apt-get install -y curl
sudo apt-get install -y zsh
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get upgrade -y

mkdir -p ~/.ssh
ssh-keygen -t rsa -f ~/.ssh/id_rsa

# ubuntu only?
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
sudo apt-get remove -y unity-webapps-common

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm install 2.1.2

chsh -s /bin/zsh 
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | ZSH=~/.oh-my-zsh sh
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.gitconfig --output $HOME/.gitconfig
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.bashrc --output $HOME/.bashrc
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.vimrc --output $HOME/.vimrc
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.gemrc --output $HOME/.gemrc
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.zshrc --output $HOME/.zshrc
# heroku?
sudo gem install pg
sudo gem install faraday
sudo gem install thin
sudo gem install sinatra
sudo gem install jsonschema
rvm use 2.1.2@rails415 --create --default
sudo gem install rails -v 4.1.5
sudo gem install devise

cd $HOME/Downloads
wget https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz
tar -xvzf go1.4.1.linux-amd64.tar.gz
sudo mv go /usr/local

if [ $(whoami) != 'vagrant' ]; then # a base box, not vm
	# Maybe in the future, https://atom.io/

	cd $HOME/Downloads
	# http://www.technoreply.com/how-to-install-sublime-text-2-on-ubuntu-12-04-unity/
	curl -v http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2 --output "Sublime Text 2.0.2 x64.tar.bz2"
	tar -vxjf Sublime\ Text\ 2.0.2\ x64.tar.bz2
	sudo mv Sublime\ Text\ 2 /opt/
	sudo ln -sfn /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime

	# http://www.sitepoint.com/10-essential-sublime-text-plugins-full-stack-developer/
	mkdir -p ~/.config/sublime-text-2/Installed\ Packages
	mkdir -p ~/.config/sublime-text-2/Packages
	cd ~/.config/sublime-text-2/Installed\ Packages
	# Package control
	wget https://sublime.wbond.net/Package%20Control.sublime-package
	# SynchedSideBar
	cd $HOME/Downloads
	wget https://github.com/sobstel/SyncedSideBar/archive/master.zip
	unzip master.zip && mv SyncedSideBar-master ~/.config/sublime-text-2/Packages/SyncedSideBar
	# Focus file sidebar
	cd $HOME/Downloads
	wget https://github.com/miguelgraz/FocusFileOnSidebar/archive/master.zip
	unzip master.zip && mv FocusFileOnSidebar-master ~/.config/sublime-text-2/Packages/FocusFileOnSidebar
	# All Autocomplete Sublime Text
	cd $HOME/Downloads
	wget https://github.com/alienhard/SublimeAllAutocomplete/archive/master.zip
	unzip master.zip && mv SublimeAllAutocomplete-master ~/.config/sublime-text-2/Packages/SublimeAllAutocomplete
	# Sublimetext markdown preview
	cd $HOME/Downloads
	wget https://github.com/revolunet/sublimetext-markdown-preview/archive/master.zip
	unzip master.zip && mv sublimetext-markdown-preview-master ~/.config/sublime-text-2/Packages/sublimetext-markdown-preview
	# Sublime terminal
	cd $HOME/Downloads
	wget https://github.com/wbond/sublime_terminal/archive/master.zip
	unzip master.zip && mv sublime_terminal-master ~/.config/sublime-text-2/Packages/sublime_terminal
	# GitGutter
	cd $HOME/Downloads
	wget https://github.com/jisaacks/GitGutter/archive/master.zip
	unzip master.zip && mv GitGutter-master ~/.config/sublime-text-2/Packages/GitGutter
	
	cd ~/.config/sublime-text-2/Packages/User
	wget https://raw.githubusercontent.com/kennyhlam/config/master/Preferences.sublime-settings
	wget https://raw.githubusercontent.com/kennyhlam/config/master/GitGutter.sublime-settings
	wget https://raw.githubusercontent.com/kennyhlam/config/master/Default%20(Linux).sublime-keymap

	# maybes
	# Side​Bar​Enhancements, https://github.com/titoBouzout/SideBarEnhancements
	# SublimeREPL, https://github.com/wuub/SublimeREPL
	# DocBlock, https://github.com/spadgos/sublime-jsdocs
fi
