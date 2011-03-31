# NOTE: before running this, be sure to add the following line to /etc/apt/sources.list
# deb http://backports.debian.org/debian-backports lenny-backports main contrib non-free
# You might want to remove this after puppet has been installed
sudo apt-get remove ruby
sudo aptitude update
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install libreadline5-dev
sudo apt-get -y install zlib1g-dev
sudo apt-get -y --force-yes install puppet
sudo apt-get install -y git-core
sudo useradd puppet

COMPILE_PATH=/tmp/src
mkdir -p $COMPILE_PATH

cd $COMPILE_PATH
wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p180.tar.gz
tar -xvvf ruby-1.9.2-p180.tar.gz
cd ruby-*
./configure
make 
install
sudo make install
cd ext/zlib
sudo ruby extconf.rb
make
sudo make install

