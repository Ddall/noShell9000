class ns9_logrotate{

  require logrotate
  require ns9_base

  file{'/var/log':
    ensure => directory,
    mode  =>  755,
  }

  logrotate::rule { 'messages':
    ensure          =>  present,
    path            =>  '/var/log/messages',
    rotate          =>  5,
    rotate_every    =>  'week',
    compress        =>  true,
    postrotate      =>  '/usr/bin/killall -HUP syslogd',
    shred           =>  true,
  }

  logrotate::rule { 'puppet-apply':
    ensure          =>  present,
    path            =>  '/var/log/puppet',
    rotate          =>  7,
    rotate_every    =>  'day',
    compress        =>  true,
    shred           =>  true,
  }

    # NGINX
  logrotate::rule { 'nginx_logs':
    ensure          =>  present,
    path            =>  '/var/log/nginx/*.log',
    rotate          =>  7,
    rotate_every    =>  'day',
    compress        =>  true,
    ifempty         =>  false,
    missingok       =>  true,
    shred           =>  true,
    postrotate      =>  '[ ! -f /var/run/nginx.pid ] || kill -USR1 `cat /var/run/nginx.pid`',
  }


}