class ns9_puppet {

  package{'puppet':
    ensure => latest,
  }

  # Librarian puppet
  exec{'librarian':
    command => '/usr/bin/gem install librarian-puppet',
    user => 'root',
    cwd => '/etc/puppet',
    creates => '/usr/local/bin/librarian-puppet'
  }

  # Scripts
  file{'/usr/local/sbin/puppet-apply':
    ensure => link,
    mode   => 700,
    source => '/etc/puppet/scripts/puppet-apply.sh'
  }

  # Puppet apply cron
  file{'/var/log/puppet':
    ensure      => directory,
    mode        => 750
  }

  # cron { 'puppet_apply':
  #   command     =>  '/usr/local/sbin/puppet-apply >> /var/log/puppet/apply.log 2> /var/log/puppet/apply.error.log',
  #   user        =>  'root',
  #   minute      =>  [20,50],
  #   hour        =>  absent,
  # }


}
