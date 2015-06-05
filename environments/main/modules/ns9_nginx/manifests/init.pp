class ns9_nginx{

  apt::ppa { 'ppa:nginx/development':
    ensure  =>  'present',
    options => []

  }->
  package{'nginx':
    ensure => latest,
  }

  service{'nginx':
    ensure => 'running',
    enable => true,
    hasrestart => true,
    hasstatus => true,
  }

  # NGINX.CONF
  file { '/etc/nginx/nginx.conf':
    ensure  =>  present,
    owner   =>  'root',
    group   =>  'root',
    mode    =>  '644',
    source  =>  'puppet:///modules/ns9_nginx/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  #Vhosts
  file{'/etc/nginx/sites-available':
    purge => true,
    ensure => present,
    owner => root,
    group => root,
    mode => 755,
    recurse => true,
    source => 'puppet:///modules/ns9_nginx/nginx/sites-available/',
    notify => Service['nginx'],
  }

  # ENABLE SITES
  file { '/etc/nginx/sites-enabled/default':
    ensure  =>  link,
    target  =>  '/etc/nginx/sites-available/default',
    notify  =>  Service['nginx'],
    require => File['/etc/nginx/sites-enabled']
  }

  file { '/etc/nginx/sites-enabled/cloud.mayo.ga':
    ensure  =>  link,
    target  =>  '/etc/nginx/sites-available/cloud.mayo.ga',
    notify  =>  Service['nginx'],
    require => File['/etc/nginx/sites-enabled']
  }



}