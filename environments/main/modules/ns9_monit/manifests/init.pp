class ns9_monit{
  package{'monit':
    ensure => latest,
  }

  service{'monit':
    ensure => running,
    hasrestart => true,
    hasstatus => true,
  }


# monitrc
  file{'/etc/monit/monitrc':
    ensure => present,
    source => 'puppet:///modules/ns9_monit/monitrc',
    notify => Service['monit'],
    mode  =>  700,
  }

# conf.d
  file{'/etc/monit/conf.d':
    purge => true,
    ensure => directory,
    recurse => true,
    sourceselect => 'all',
    source => [
      'puppet:///modules/ns9_monit/conf.d',
    ],
    notify => Service['monit'],
  }
}