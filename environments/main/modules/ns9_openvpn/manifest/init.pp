class ns9_openvpn{

  # openvpn::server { 'mayo':
    # country      => 'INTERNET',
    # organization => 'mayo.ga',
    # email        => 'root@mayo.ga',
    # server       => '10.200.200.0 255.255.255.0',
  # }

  ## define clients
  # openvpn::client { 'ddglx':
    # server => 'winterthur',
  # }
  # openvpn::client_specific_config { 'client1':
    # server => 'winterthur',
    # ifconfig => '10.200.200.50 10.200.200.51',
  # }

}