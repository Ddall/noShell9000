#!/bin/bash

cd /etc/puppet/ 
git pull origin master
puppet apply /etc/puppet/manifests/site.pp --modulepath=/etc/puppet/modules:/usr/share/puppet/modules
