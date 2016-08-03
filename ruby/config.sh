# install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm install 2.1.2

ln -sf $(readlink -f .gemrc) ~/.gemrc

# setup ruby
rvm use 2.1.2@rails415 --create --default
sudo gem install pg
sudo gem install faraday
sudo gem install thin
sudo gem install sinatra
sudo gem install jsonschema
sudo gem install rails -v 4.1.5
sudo gem install devise

