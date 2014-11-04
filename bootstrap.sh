#!/bin/bash

apt-get update
apt-get install -y apache2
apt-get install -y postgresql-9.3
apt-get install -y git
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y libpq-dev
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get upgrade

su -c "source /home/vagrant/development/user-config.sh" vagrant