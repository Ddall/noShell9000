#!/bin/bash
source /etc/puppet/parameters.sh

cd /etc/puppet
git pull origin $branchname
librarian-puppet update
puppet apply /etc/puppet/environments/main/manifests/site.pp --environment=main --modulepath=/etc/puppet/modules:/etc/puppet/environments/main/modules

