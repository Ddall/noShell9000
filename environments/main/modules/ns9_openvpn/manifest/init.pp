class ns9_openvpn{

  # openvpn::server { 'mayo':
    # country      => 'INTERNET',
    # organization => 'mayo.ga',
    # email        => 'root@mayo.ga',
    # server       => '10.200.200.0 255.255.255.0',
  # }

  package{'openvpn':
    ensure  => latest,
  }

  wget::fetch { "download openvpnaccess server":
    source      => "http://swupdate.openvpn.org/as/openvpn-as-2.0.17-Ubuntu14.amd_64.deb",
    destination => "/usr/local/src/openvpn-as-2.0.17-Ubuntu14.amd_64.deb",
    timeout     => 0,
    verbose     => false,
    require => Package['openvpn']
  }->
  exec { "install openvpn access srv":
    command => "/usr/bin/dpkg -i /usr/local/src/openvpn-as-2.0.17-Ubuntu14.amd_64.deb",
    creates => "/usr/local/openvpn_as/bin/ovpn-init",
  }

}