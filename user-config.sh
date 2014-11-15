#!/bin/bash

apt-get update
apt-get install -y apache2
apt-get install -y postgresql-9.3
apt-get install -y git
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y libpq-dev
apt-get install -y vim
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get upgrade

curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.gitconfig --output $HOME/.gitconfig
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.bashrc --output $HOME/.bashrc
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.vimrc --output $HOME/.vimrc
curl -v https://raw.githubusercontent.com/kennyhlam/config/master/.gemrc --output $HOME/.gemrc

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm install 2.1.2
rvm use 2.1.2@rails415 --create --default
gem install rails -v 4.1.5
gem install pg

if [ $(whoami) != 'vagrant']; then # a base box, not vm
	cd $HOME/Downloads
	curl -v http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2 --output "Sublime Text 2.0.2 x64.tar.bz2"
	tar -vxjf Sublime\ Text\ 2.0.2\ x64.tar.bz2
	sudo mv Sublime\ Text\ 2 /opt/
	sudo ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime
	# http://www.technoreply.com/how-to-install-sublime-text-2-on-ubuntu-12-04-unity/
	# Package Control
	# SynchedSideBar
	# Focus file sidebar
fi