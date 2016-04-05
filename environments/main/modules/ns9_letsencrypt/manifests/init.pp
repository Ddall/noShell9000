class ns9_letsencrypt{

  exec { "install letsencrypt":
    command => "/usr/bin/git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt",
    creates => "/opt/letsencrypt/letsencrypt-auto",
  }

}
