#!/bin/bash

cd /etc/puppet/ 
git pull origin master
puppet apply /etc/puppet/environments/main/manifests/site.pp --environment=main --modulepath=/etc/puppet/environments/main/modules:modules/etc/puppet/modules
