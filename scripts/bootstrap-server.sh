#!/bin/sh

#STEP 1
apt-get update
apt-get install ssh git wget build-essential ruby-dev -y
gem install librarian-puppet

sudo ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa
passwd -l root

#@docs:https://docs.puppetlabs.com/guides/install_puppet/install_debian_ubuntu.html
cd /root
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb
sudo apt-get update
sudo apt-get install puppet -y

cd /etc/puppet
git init

git config --global user.email "root@localhost"
git config --global user.name "root"

ssh -oStrictHostKeyChecking=no github.com
git remote add origin git@github.com:Ddall/lamp-bootstraper.git
cat /root/.ssh/id_rsa.pub
#END OF STEP 1

# add the key to the repo

# STEP 2
git fetch
git reset --hard origin/vps-dawap-site
git branch --set-upstream-to=origin/vps-dawap-site

librarian-puppet install
bash /etc/puppet/scripts/puppet-apply.sh
#END OF STEP 2
