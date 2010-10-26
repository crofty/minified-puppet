sudo apt-get remove ruby
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install libreadline5-dev

COMPILE_PATH=/tmp/src
mkdir -p $COMPILE_PATH

cd $COMPILE_PATH
wget http://rubyforge.org/frs/download.php/71100/ruby-enterprise_1.8.7-2010.02_i386_ubuntu10.04.deb
sudo dpkg -i ruby-enterprise_1.8.7-2010.02_i386_ubuntu10.04.deb

cd $COMPILE_PATH
wget http://rubyforge.org/frs/download.php/70696/rubygems-1.3.7.tgz
tar -xvzf rubygems-1.3.7.tgz
cd rubygems-1.3.7
ruby setup.rb

sudo gem install puppet --no-ri --no-rdoc
sudo useradd puppet

sudo apt-get install -y git-core
