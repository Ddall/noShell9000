class ns9_cron{

  #Suksxron
  file{'/home/web/parser/run.php':
    ensure => present,
    owner => "www-data",
    group => "www-data",
  }

  cron{'parser-run':
    command => '/usr/bin/php /home/web/parser/run.php',
    user    => 'www-data',
    minute  => 6,
    hour    => 13,
    require => File['/home/web/parser/run.php'],
  }

}