define samba::global(
  $bind_interfaces_only = 'NONE',
  $dns_proxy            = 'NONE',
  $encrypt_passwords    = 'NONE',
  $host_msdfs           = 'NONE',
  $hosts_allow          = 'NONE',
  $idmap_gid            = 'NONE',
  $idmap_uid            = 'NONE',
  $interfaces           = 'NONE',
  $load_printers        = 'NONE',
  $local_master         = 'NONE',
  $log_file             = 'NONE',
  $log_level            = 'NONE',
  $max_log_size         = 'NONE',
  $netbios_name         = 'NONE',
  $password_server      = 'NONE',
  $realm                = 'NONE',
  $remote_announce      = 'NONE',
  $security             = 'NONE',
  $server_string        = 'NONE',
  $socket_options       = 'NONE',
  $syslog               = 'NONE',
  $unix_extensions      = 'NONE',
  $wide_links           = 'NONE',
  $wins_server          = 'NONE',
  $workgroup            = 'NONE',
  $smb_conf_filename    = '/etc/samba/smb.conf',
  $ensure               = present,
  $priority             = '1',
) {
  include samba

  if ! ($::osfamily in ['Debian']) {
    fail("samba::global does not support osfamily ${::osfamily}")
  }

  realize Concat[$smb_conf_filename]

  concat::fragment { 'global':
    ensure  => $ensure,
    target  => $smb_conf_filename,
    content => template('samba/global.erb'),
    order   => $priority,
  }

}
