class ns9_owncloud{

  file{'/home/web/owncloud':
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',

  }

  file{'/home/web/owncloud/public':
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',
    require => File['/home/web/owncloud']
  }

  package{'mailutils':
    ensure => latest,
  }

  package{'libreoffice-core':
    ensure => latest,
  }

  file{'/home/web/owncloud/data':
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',
    mode  => 770,
    require => File['/home/web/owncloud']
  }

  exec{'clone owncloud':
    cwd     => '/home/web/owncloud',
    command => '/usr/bin/sudo -u www-data /bin/bash /etc/puppet/environments/main/modules/ns9_owncloud/files/owncloud_install.sh',
    creates => '/home/web/owncloud/public/index.php',
    require => File['/home/web/owncloud']
  }

  #SSL
  exec { 'make ssl cert for cloud.hexadec.net':
    cwd     =>  "/etc/nginx",
    command =>  '/usr/bin/openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /etc/nginx/ssl/cloud.hexadec.net.key -out /etc/nginx/ssl/cloud.hexadec.net.crt -subj "/C=FR/ST=FRANCE/L=INTERNET/O=DDX/OU=IT Department/CN=cloud.hexadec.net"',
    creates =>  "/etc/nginx/ssl/cloud.hexadec.net.crt",
    notify  =>  Service['nginx'], # Restart service when file is changed
  }

  cron{'owncloud cron':
    ensure => present,
    command => '/usr/bin/php /home/web/owncloud/public/cron.php',
    user => 'www-data',
    minute => '*/5',
    hour => '*',
  }

  ## Housekeeping
  logrotate::rule { 'owncloud':
    ensure          =>  present,
    path            =>  '/home/web/owncloud/data/owncloud.log',
    rotate          =>  2,
    rotate_every    =>  'day',
    compress        =>  true,
    shred           =>  true,
    missingok       =>  true,
    ifempty         =>  false,
    create          =>  true,
    create_owner    =>  'www-data',
    create_group    =>  'www-data',
    create_mode     =>  '640',
  }

}
