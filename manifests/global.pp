define samba::global(
  $bind_interfaces_only = 'yes',
  $dns_proxy            = 'no',
  $encrypt_passwords    = 'yes',
  $host_msdfs           = 'yes',
  $hosts_allow          = '131.252.0.0/255.255.0.0',
  $idmap_gid            = '40000-60000',
  $idmap_uid            = '40000-60000',
  $interfaces           = '131.252.208.199/24',
  $load_printers        = 'no',
  $local_master         = 'no',
  $log_file             = '/var/samba/log/log.%m',
  $log_level            = '3',
  $max_log_size         = '50',
  $netbios_name         = 'STASH',
  $password_server      = '*',
  $realm                = 'DS.CECS.PDX.EDU',
  $remote_announce      = ['131.252.210.113', '131.252.210.114'],
  $security             = 'ADS',
  $server_string        = 'Unix Stash Server',
  $socket_options       = ['TCP_NODELAY', 'SO_RCVBUF=8192', 'SO_SNDBUF=8192'],
  $syslog               = '1',
  $unix_extensions      = 'no',
  $wide_links           = 'yes',
  $wins_server          = ['kirkwood.cecs.pdx.edu', 'fernie.cecs.pdx.edu'],
  $workgroup            = 'CECS',
  $smb_conf_filename    = '/etc/samba/smb.conf',
  $ensure               = present,
  $priority             = '1',
) {
  include samba

  if ! ($osfamily in ['Debian']) {
    fail("samba::global does not support osfamily $osfamily")
  }

  realize Concat["$smb_conf_filename"]

  concat::fragment { "global":
    ensure  => $ensure,
    target  => $smb_conf_filename,
    content => template('samba/global.erb'),
    order   => $priority,
  }

}
