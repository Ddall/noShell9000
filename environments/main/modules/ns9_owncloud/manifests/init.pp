class ns9_owncloud{

  file{'/home/web/owncloud':
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',
  }

  #SSL
  exec { 'make ssl cert for cloud.mayo.ga':
    cwd     =>  "/etc/nginx",
    command =>  '/usr/bin/openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /etc/nginx/ssl/cloud.mayo.ga.key -out /etc/nginx/ssl/cloud.mayo.ga.crt -subj "/C=FR/ST=FRANCE/L=INTERNET/O=DDX/OU=IT Department/CN=cloud.mayo.ga"',
    creates =>  "/etc/nginx/ssl/cloud.mayo.ga.crt",
    notify  =>  Service['nginx'], # Restart service when file is changed
  }

}