class ns9_owncloud{

  file{'/home/web/owncloud':
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',
  }

}