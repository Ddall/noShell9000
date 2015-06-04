class ns9_base_security{

  file { '/etc/ssh/sshd_config':
    owner   =>  'root',
    group   =>  'root',
    mode    =>  '640',
    notify  =>  Service['ssh'],
    source  =>  'puppet:///modules/ns9_base_security/sshd_config'
  }

  service { 'ssh':
    ensure    =>  running,
    enable    =>  true,
    hasstatus =>  true,
    hasrestart  =>  true,
  }

}