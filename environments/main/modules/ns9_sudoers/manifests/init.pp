class ns9_sudoers{

  class { 'sudo':
    purge               => false,
    config_file_replace => false,
  }

  group{'sudonopw':
    ensure => present
  }

  # SUDO NO PW
  sudo::conf { 'sudonopw':
    priority => 20,
    content  => "%sudonopw ALL=(ALL) NOPASSWD: ALL",
  }
}
