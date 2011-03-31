sudo apt-get remove ruby
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install libreadline5-dev

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

cd $COMPILE_PATH
wget http://rubyforge.org/frs/download.php/70696/rubygems-1.3.7.tgz
tar -xvzf rubygems-1.3.7.tgz
cd rubygems-1.3.7
ruby setup.rb

sudo gem install puppet --no-ri --no-rdoc
sudo useradd puppet

sudo apt-get install -y git-core
