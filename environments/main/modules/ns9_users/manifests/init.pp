class ns9_users{

  accounts::user { 'ddall':
    groups  => [
      'admin',
      'sudonopw',
    ],
    sshkeys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAoRLd705AdzuG8xr+HC9nwCIJeOanwEBL3WLnqDDZyNIeUQAaNZqu66MHvnJ6FLAPWAVmCYFUXd4w9Qb0nrVdD62iq3U2Hn01WP3/JX/LjTQXm6kczbSRbFiMqMG+6X9PeVYQteqfGm0qpd0XAFKu521iOY3XIBUCKGbWJ4aZrVk= rsa-key-allan-perso',
      'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAv6WhtghYhobEa/al2zl+6gJ5IHRHJRH/l0W50Uq+07bhgom81zf8NSQ/CrJ05cxmvXBnEKhCzHdl9kKllFSLog/ijdUb6UYJxYagETBby+RNUsB0dwB/NqUK+vOoH+f8ZUYW6ZAGp4gfQcxL6AoJOu2NnHjxinwqEX1FFbQQC3uNEGHdo3M8Q6/8PYOKcc8ZW9s2xJaKfIQWCgfmpNfo4rOZQNmLRzRCKjj3TesbAhtZIrL2b89gjqsuFNzPCQuBNLvc1kWtsIcA0J2DOaWxSp/uSzu10xyhNydELTSQgdRrXabF2cx+kGk5OwtLNuag5WpKhXPr3lPjWehxJUpaFQ== rsa-key-allan_voyage',
      'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAsYbBuW2Z4YUsZvPloSLmpLhhx2pccqA3zblBsawzaP9QrkLGL+30svuJXua7Ds4P5wB0BXE8WBkY6edzw9fBQz7Y4SoEWOtIot/36hShFvQnThhw/BG8dxUPoNFoGwy5OiBpoSD21S9BA9aiuilF47c0Yh9h4t9gW5FNSuNBaEfsDLFKqL3CWYfkbDN9jF3ely3u1z+SbyPPOVjCln4WzVTFBhonlj2YFaOl0WSe8LSLqhfTeODbbrAVBP/ZX4UUm0NRPqVKURi5lyD1v0Tt9w+YbGg8AtxQp4bH9NsB4A1e3WRLClDZFIs5dD8wNQG3FT3MncceF0QGZGm8noF+yQ== rsa-key-allan-20150603',
      # '',
    ],
  }

  # refresh .bashrc
  file_line { '/etc/skel/.bashrc':
    path    => '/home/ddall/.bashrc',
    line    => 'force_color_prompt=yes',
    match   => '^#force_color_prompt=yes$',
  }
}
