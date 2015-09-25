class ns9_users{

  user{"ddall":
    ensure => present,
    home => '/home/ddall',
    shell => '/bin/bash',
    managehome => true,
  }

  ssh_authorized_key { 'ddx-voyage-key':
    user => 'ddall',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAv6WhtghYhobEa/al2zl+6gJ5IHRHJRH/l0W50Uq+07bhgom81zf8NSQ/CrJ05cxmvXBnEKhCzHdl9kKllFSLog/ijdUb6UYJxYagETBby+RNUsB0dwB/NqUK+vOoH+f8ZUYW6ZAGp4gfQcxL6AoJOu2NnHjxinwqEX1FFbQQC3uNEGHdo3M8Q6/8PYOKcc8ZW9s2xJaKfIQWCgfmpNfo4rOZQNmLRzRCKjj3TesbAhtZIrL2b89gjqsuFNzPCQuBNLvc1kWtsIcA0J2DOaWxSp/uSzu10xyhNydELTSQgdRrXabF2cx+kGk5OwtLNuag5WpKhXPr3lPjWehxJUpaFQ==',
  }

  ssh_authorized_key { 'ddx-laptop-key':
    user => 'ddall',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAhmGbhNEcUzZUrqEqQEUokimprTZ4MtJ4BfHGhjG7BR72i1g6dKKbanplYngVbnS+YLk67KVxuwi3qP/s5FNLyKZ/q8POx4piScRwy+EB5heKXRFPMwHo8XXheOHcS3GtKjLrcoivzGaxGczz+fIGIQ2LIvZ/QeILhe7q535KrXd11H+iyRK3gmh+IZKQ0IPPdJbRyEELBSEVyV9K6dXelYdVKKa1/TW9PM3bWWthVq5IBqZ+paEU2WYGSXIkeIPY1zHu/RoetUitokyKIHcC42NokeW/6oUxBoMpddZKN4rxKF6xS7X/YWkiAQIMS7AZC6r9QGcQFN6CHEdOkerqxQ==',
  }

  file_line { 'ddall ALL=(ALL) NOPASSWD: ALL':
    ensure => present,
    line   => 'ddall ALL=(ALL) NOPASSWD: ALL',
    path   => '/etc/sudoers',
  }

  # refresh .bashrc
  file_line { '/etc/skel/.bashrc':
    path    => '/home/ddall/.bashrc',
    line    => 'force_color_prompt=yes',
    match   => '^#force_color_prompt=yes$',
  }
}