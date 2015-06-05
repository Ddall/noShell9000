class ns9_mysql {
  class { '::mysql::server':
    remove_default_accounts => true,
    service_enabled         => true,
    override_options => {
      mysqld => {
        bind-address    =>  '0.0.0.0',
        'server-id'     =>  2,
        'query_cache_type' => 1,
        'query_cache_size' => '256M',
        'query_cache_limit' => '2M',
        'query_cache_strip_comments' => 1,
      }
    },
    databases => {
      'owncloud' => {
        ensure  => present,
        charset => 'utf8',
      },
    },
    users => {
      'ns9_ow@localhost'    => {
        ensure                   => present,
        max_connections_per_hour => '0',
        max_queries_per_hour     => '0',
        max_updates_per_hour     => '0',
        max_user_connections     => '0',
        password_hash            => '*3B9B2465C3079282ED2FDF05AF90F10ED289A307',
      },

    },
    grants => {
      'ns9_ow@localhost/owncloud.*' => {
        ensure     => present,
        privileges => ['ALL PRIVILEGES'],
        table      => 'owncloud.*',
        user       => 'ns9_ow@localhost',
      },

    }
  }

}
