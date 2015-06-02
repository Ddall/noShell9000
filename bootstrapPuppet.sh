#!/bin/sh
#
apt-get install ssh git wget build-essential ruby-dev -y
sudo ssh-keygen -t rsa -b 2048

#@docs:https://docs.puppetlabs.com/guides/install_puppet/install_debian_ubuntu.html
cd /root
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get update
sudo apt-get install puppet -y

cd /etc/puppet
git init

git remote add origin git@github.com:Ddall/noShell9000.git
git fetch
git reset --hard origin/master
git branch --set-upstream-to=origin/master master

git config --global user.email "root@localhost"
git config --global user.name "rootKeeper"

bash /etc/puppet/manifest/ns9_base/files/ns9-puppet-apply.sh