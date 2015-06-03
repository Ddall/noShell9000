class ns9_firewall{
  require firewall

  # DO NOT CHANGE THE ORDER OF THIS
  stage { 'ns9_firewall_pre':  before  => Stage['main']; }
  stage { 'ns9_firewall_post': require => Stage['main']; }

  class { 'firewall':
    stage => 'ns9_firewall_pre',
  }

  # rules
  class { 'ns9_firewall::pre':
    stage => 'ns9_firewall_pre',
  }

  # deny all the rest
  class { 'ns9_firewall::post':
    stage => 'ns9_firewall_post',
  }

  resources { "firewall":
    purge => true
  }

    
}