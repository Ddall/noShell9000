class ns9_fail2ban{

  class { 'fail2ban':
    package_ensure => 'latest',
    service_ensure => 'running',
    service_enable => true,
    config_dir_purge  => true,
    config_file_template => "fail2ban/${::lsbdistcodename}/etc/fail2ban/jail.conf.erb",
  }

  # Add custom filters
  file{'/etc/fail2ban/filter.d':
    ensure => directory,
    purge => false,
    recurse => true,
    source => 'puppet:///modules/ns9_fail2ban/filter.d',
  }

  # Add custom jails
  file{'/etc/fail2ban/jail.d':
    ensure => directory,
    purge => false,
    recurse => true,
    source => 'puppet:///modules/ns9_fail2ban/jail.d',
  }




}