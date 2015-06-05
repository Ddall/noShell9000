class ns9_phpfpm{

    $optionnal_pkgs = [
      'php5-apcu',
      'php5-mcrypt',
      'php5-memcached',
      'php5-mysql',
      'php5-cli',
      'php5-curl',
      'php5-gd',
      'php5-json',
      'php5-intl',
      'php-pear',
      'php5-mysqlnd',
      'php5-pgsql',
      'php5-readline',
      'php5-sqlite',
      'php-xml-parser',
    ]

    class { 'phpfpm':
      process_max => 2,
      log_level   => 'warning',
      error_log   => '/var/log/php5-fpm.log',
    }->

    package { $optionnal_pkgs:
      ensure  =>  latest,
    }->

    phpfpm::pool { 'www':
      ensure                  => present,
      pm                      => 'static',
      pm_max_children         => 2,
      pm_max_requests         => 512,
      listen                  => '/var/run/php5-fpm.sock',
      listen_mode             => '0660',
      listen_owner            => 'www-data',
      listen_group            => 'www-data',
      php_admin_flag         => {
        'expose_php' => 'Off',
      },
      php_admin_value        => {
        'max_execution_time' => '300',
      },
    }->

    file{ '/etc/php5/fpm/php.ini' :
      ensure  =>  present,
      source  =>  'puppet:///modules/ns9_phpfpm/php.ini',
    }

}