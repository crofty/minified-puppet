sudo apt-get -y update
sudo apt-get -y dist-upgrade

# Add repo to get decent version of puppet installed, then remove repo
echo 'deb http://backports.debian.org/debian-backports lenny-backports main contrib non-free' | sudo tee --append /etc/apt/sources.list
sudo aptitude update
sudo apt-get -y --force-yes install puppet
sed -n '$!p' /etc/apt/sources.list | sudo tee /etc/apt/sources.list
sudo aptitude update

