class ns9_fail2ban{

  class { 'fail2ban':
    package_ensure => 'latest',
    service_ensure => 'running',
    service_enable => true,
    config_dir_purge  => true,
    config_file_template => "fail2ban/${::lsbdistcodename}/etc/fail2ban/jail.conf.erb",
    config_file_hash => {
      'jail.2nd.conf' => {
        config_file_path   => '/etc/fail2ban/jail.2nd.conf',
        config_file_string => '# THIS FILE IS MANAGED BY PUPPET
[owncloud]
  enabled  = true
  port     = http,https
  filter   = owncloud
  logpath  = /var/www/owncloud/data/owncloud.log
  maxretry = 6
        ',
      }
    }

  }

  # Add custom filters
  file{'/etc/fail2ban/filter.d':
    ensure => directory,
    purge => false,
    recurse => true,
    source => 'puppet:///modules/ns9_fail2ban/filter.d',
  }



}