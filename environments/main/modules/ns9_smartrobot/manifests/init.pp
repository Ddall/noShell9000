class ns9_smartrobot{

  file{'/home/web/SmartRobot':
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',
  }

  exec{'clone smartrobot':
    cwd     => '/home/web',
    command => '/usr/bin/sudo -u www-data /bin/bash /etc/puppet/environments/main/modules/ns9_smartrobot/files/smartrobot_install.sh',
    creates => '/home/web/SmartRobot/app/console',
    require => File['/home/web/SmartRobot']
  }

  #SSL
  exec { 'make ssl cert for smartbot.mayo.ga':
    cwd     =>  "/etc/nginx",
    command =>  '/usr/bin/openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /etc/nginx/ssl/smartbot.mayo.ga.key -out /etc/nginx/ssl/smartbot.mayo.ga.crt -subj "/C=FR/ST=FRANCE/L=INTERNET/O=DDX/OU=IT Department/CN=smartbot.mayo.ga"',
    creates =>  "/etc/nginx/ssl/smartbot.mayo.ga.crt",
    notify  =>  Service['nginx'], # Restart service when file is changed
  }

  cron{'smartbot cron':
    ensure => present,
    command => '/usr/bin/php /home/web/SmartRobot/app/console markets:refresh',
    user => 'www-data',
    minute => '*/2',
    hour => '*',
  }

  ## Housekeeping
  logrotate::rule { 'smartbotlogs':
    ensure          =>  present,
    path            =>  '/home/web/smartrobot/app/logs/*.log',
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
