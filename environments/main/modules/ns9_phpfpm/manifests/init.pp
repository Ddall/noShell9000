class ns9_phpfpm{

    $optionnal_pkgs = [
      'php7.0-mcrypt',
      'php7.0-mbstring',
      'php7.0-mysql',
      'php7.0-fpm',
      'php7.0-cli',
      'php7.0-curl',
      'php7.0-gd',
      'php7.0-json',
      'php7.0-intl',
      'php-memcached',
      'php-pear',
      'php7.0-pgsql',
      'php7.0-opcache',
      'php7.0-readline',
      'php7.0-sqlite',
      'php7.0-xml',
      'php7.0-zip',
    ]

    class { 'phpfpm':
      process_max => 2,
      log_level   => 'warning',
      error_log   => '/var/log/php7.0-fpm.log',
    }->

    package { $optionnal_pkgs:
      ensure  =>  latest,
    }->

    phpfpm::pool { 'www':
      ensure                  => present,
      pm                      => 'static',
      pm_max_children         => 2,
      pm_max_requests         => 512,
      listen                  => '/var/run/php/php7.0-fpm.sock',
      listen_mode             => '0660',
      listen_owner            => 'www-data',
      listen_group            => 'www-data',
      php_admin_flag         => {
        'expose_php' => 'Off',
      },
      php_admin_value        => {
        'max_execution_time' => '300',
      },
      env                    => {
        'PATH' => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      },
    }->

    file{ '/etc/php/7.0/fpm/php.ini' :
      ensure  =>  present,
      source  =>  'puppet:///modules/ns9_phpfpm/php.ini',
    }

    file{ '/etc/php/7.0/cli/php.ini' :
      ensure  =>  present,
      source  =>  'puppet:///modules/ns9_phpfpm/php.ini',
    }

  # install composer
  exec { 'install composer':
    cwd     =>  "/usr/local/bin",
    command =>  '/usr/bin/curl -sS https://getcomposer.org/installer | /usr/bin/php',
    creates =>  "/usr/local/bin/composer.phar",
  }

}
