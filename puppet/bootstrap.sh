sudo apt-get remove ruby
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install libreadline5-dev
sudo apt-get -y install zlib1g-dev
sudo apt-get -y install puppet

# COMPILE_PATH=/tmp/src
# mkdir -p $COMPILE_PATH
# 
# cd $COMPILE_PATH
# wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p180.tar.gz
# tar -xvvf ruby-1.9.2-p180.tar.gz
# cd ruby-*
# ./configure
# make 
# install
# sudo make install
# cd ext/zlib
# sudo ruby extconf.rb
# make
# sudo make install
# 
# cd $COMPILE_PATH
# wget http://production.cf.rubygems.org/rubygems/rubygems-1.6.2.tgz
# tar -xvzf rubygems-1.6.2.tgz
# cd rubygems-1.6.2
# sudo ruby setup.rb
# 
# sudo gem install puppet --no-ri --no-rdoc
sudo useradd puppet

sudo apt-get install -y git-core
