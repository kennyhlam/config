# install ruby-install
wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
tar -xzvf ruby-install-0.7.0.tar.gz
cd ruby-install-0.7.0/
sudo make install

ruby-install ruby 2.5.1

# install chruby
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install

echo "ruby-2.5.1" > ~/.ruby-version
chruby ruby-2.5.1

gem install bundler jekyll

# setup ruby
gem install pg
gem install faraday
gem install thin
gem install sinatra
gem install jsonschema
# gem install rails -v 4.1.5
gem install devise

