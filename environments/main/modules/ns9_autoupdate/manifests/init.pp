class ns9_autoupdate{

  package{'unattended-upgrades':
    ensure => latest,
  }
  ->file_line { 'enable unattended upgrades':
    ensure => present,
    line   => '      "${distro_id}:${distro_codename}-updates";',
    match   => '//      "${distro_id}:${distro_codename}-updates";',
    path   => '/etc/apt/apt.conf.d/50unattended-upgrades',
  }
  ->file_line { 'enable security updates':
    ensure => present,
    line   => '      "${distro_id}:${distro_codename}-security"";',
    match   => '//      "${distro_id}:${distro_codename}-security"";',
    path   => '/etc/apt/apt.conf.d/50unattended-upgrades',
  }
  ->file_line{'email notifications':
    ensure  =>  present,
    path    => '/etc/apt/apt.conf.d/50unattended-upgrades',
    line    =>  'Unattended-Upgrade::MinimalSteps "true";
Unattended-Upgrade::Mail "root";',

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