class ns9_autoupdate{

  package{'unattended-upgrades':
    ensure => latest,
  }
  # file_line { 'enable unattended upgrades':
    # ensure => present,
    # line   => '      "${distro_id}:${distro_codename}-updates";',
    # match  => '//      "${distro_id}:${distro_codename}-updates";',
    # path   => '/etc/apt/apt.conf.d/50unattended-upgrades',
  # }

  # file_line { 'enable security updates':
    # ensure => present,
    # line   => '      "${distro_id}:${distro_codename}-security"";',
    # match  => '//      "${distro_id}:${distro_codename}-security"";',
    # path   => '/etc/apt/apt.conf.d/50unattended-upgrades',
  # }


  file_line { 'enable auto reboot':
    ensure => present,
    line   => 'Unattended-Upgrade::Automatic-Reboot-Time "02:00";',
    match  => '//Unattended-Upgrade::Automatic-Reboot-Time "02:00";',
    path   => '/etc/apt/apt.conf.d/50unattended-upgrades',
  }
  file_line { 'enable minimal steps':
    ensure => present,
    line   => 'Unattended-Upgrade::MinimalSteps "true";',
    match  => '//Unattended-Upgrade::MinimalSteps "true";',
    path   => '/etc/apt/apt.conf.d/50unattended-upgrades',
  }
  file_line { 'enable miniman steps':
    ensure => present,
    line   => 'Unattended-Upgrade::Automatic-Reboot "true";',
    match  => '//Unattended-Upgrade::Automatic-Reboot "false";',
    path   => '/etc/apt/apt.conf.d/50unattended-upgrades',
  }


  file{'/etc/apt/apt.conf.d/10periodic':
    path => '/etc/apt/apt.conf.d/10periodic',
    ensure => present,
    content => 'APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";'

  }
}