class ns9_nginx{

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
    source  =>  'puppet:///modules/ns9_nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file{ '/etc/nginx/ssl':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
  }

  # WWW Root
  file{'/home/web':
    ensure => 'directory',
    owner => 'www-data',
    group => 'www-data',
  }

  #Vhosts
  file{'/etc/nginx/sites-available':
    purge => true,
    ensure => present,
    owner => root,
    group => root,
    mode => 755,
    recurse => true,
    source => 'puppet:///modules/ns9_nginx/sites-available/',
    notify => Service['nginx'],
  }

  file{'/etc/nginx/sites-enabled':
    ensure => directory
  }

  # ENABLE SITES
  file { '/etc/nginx/sites-enabled/default':
    ensure  =>  link,
    target  =>  '/etc/nginx/sites-available/default',
    notify  =>  Service['nginx'],
    require => File['/etc/nginx/sites-enabled']
  }

  file { '/etc/nginx/sites-enabled/cloud.hexadec.net':
    ensure  =>  link,
    target  =>  '/etc/nginx/sites-available/cloud.hexadec.net',
    notify  =>  Service['nginx'],
    require => File['/etc/nginx/sites-enabled']
  }

  file { '/etc/nginx/sites-enabled/smartbot.hexadec.net':
    ensure  =>  link,
    target  =>  '/etc/nginx/sites-available/smartbot.hexadec.net',
    notify  =>  Service['nginx'],
    require => File['/etc/nginx/sites-enabled']
  }

  file { '/etc/nginx/sites-enabled/event.hexadec.net':
    ensure  =>  link,
    target  =>  '/etc/nginx/sites-available/event.hexadec.net',
    notify  =>  Service['nginx'],
    require => File['/etc/nginx/sites-enabled']
  }

}
