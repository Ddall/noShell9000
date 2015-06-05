class ns9_nginx{

  apt::ppa { 'ppa:nginx/development': }

  package{'nginx':
    ensure => latest,
  }

  service{'nginx':
    ensure => 'running',
    enable => true,
    hasrestart => true,
    hasstatus => true,
  }
  

}