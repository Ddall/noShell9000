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

}