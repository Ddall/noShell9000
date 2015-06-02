class ns99_firewall{
  require firewall

  # DO NOT CHANGE THE ORDER OF THIS
  stage { 'prod_firewall_pre':  before  => Stage['main']; }
  stage { 'prod_firewall_post': require => Stage['main']; }

  class { 'firewall':
    stage => 'prod_firewall_pre',
  }

  # rules
  class { 'prod_firewall::pre':
    stage => 'prod_firewall_pre',
  }

  # deny all the rest
  class { 'prod_firewall::post':
    stage => 'prod_firewall_post',
  }

  resources { "firewall":
    purge => true
  }

    
}