class ns9_sshserver{

  file { '/etc/ssh/sshd_config':
    owner   =>  'root',
    group   =>  'root',
    mode    =>  '640',
    notify  =>  Service['ssh'],
    source  =>  'puppet:///modules/sshserver/sshd_config'
  }

  service { 'ssh':
    ensure    =>  running,
    enable    =>  true,
    hasstatus =>  true,
    hasrestart  =>  true,
  }


}
