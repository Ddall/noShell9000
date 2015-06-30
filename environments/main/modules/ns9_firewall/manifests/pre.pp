
class ns9_firewall::pre{
    Firewall {
        require => undef,
    }
    
    # Default firewall rules
    firewall { '000 accept all icmp':
        proto   => 'icmp',
        action  => 'accept',
    }
    firewall { '001 accept all to lo interface':
        proto   => 'all',
        iniface => 'lo',
        action  => 'accept',
    }
    firewall { "002 reject local traffic not on loopback interface":
        iniface     => '! lo',
        proto       => 'all',
        destination => '127.0.0.1/8',
        action      => 'reject',
    }
    firewall { '003 accept related established rules':
        proto   => 'all',
        state => ['RELATED', 'ESTABLISHED'],
        action  => 'accept',
    }
    # Allow SSH
    firewall { '100 allow ssh access':
        port   => '22',
        proto  => tcp,
        action => accept,
    }
    
    # Allow HTTP
    firewall { '101 allow http access':
        port   => '80',
        proto  => tcp,
        action => accept,
    }

    # Allow HTTPS
    firewall { '102 allow https access':
        port   => '443',
        proto  => tcp,
        action => accept,
    }

    # Allow OpenVPN SA
    firewall { '103 allow ovpnsa access':
        port   => '943',
        proto  => tcp,
        action => accept,
    }


}