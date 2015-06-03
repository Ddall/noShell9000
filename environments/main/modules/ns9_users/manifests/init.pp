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

  file_line { 'ddall ALL=(ALL) NOPASSWD: ALL':
    ensure => present,
    line   => 'ddall ALL=(ALL) NOPASSWD: ALL',
    path   => '/etc/sudoers',
  }
}