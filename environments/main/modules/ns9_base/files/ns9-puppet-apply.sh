#!/bin/bash

cd /etc/puppet/
git pull origin master
#librarian-puppet update
puppet apply /etc/puppet/environments/main/manifests/site.pp --environment=main --modulepath=/etc/puppet/environments/main/modules:/etc/puppet/modules
