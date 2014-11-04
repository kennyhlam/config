#!/bin/bash

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm install 2.1.2
rvm use 2.1.2@rails415 --create --default
echo "gem: --no-rdoc --no-ri" >> /home/vagrant/.gemrc
gem install rails -v 4.1.5