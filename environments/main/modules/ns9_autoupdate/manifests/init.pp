class ns9_autoupdate{

  include apt
  include unattended_upgrades

  class { 'unattended_upgrades':
    auto => { 'reboot' => false },
  }

}
