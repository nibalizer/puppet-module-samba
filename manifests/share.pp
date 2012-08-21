define samba::share(
  $msdfs_root             = 'NONE',
  $msdfs_proxy            = 'NONE',
  $browseable             = 'NONE',
  $comment                = 'NONE',
  $path                   = 'NONE',
  $writeable              = 'NONE',
  $force_create_mode      = 'NONE',
  $force_directory_mode   = 'NONE',
  $force_group            = 'NONE',
  $public                 = 'NONE',
  $create_mask            = 'NONE',
  $directory_mask         = 'NONE',
  $inherit_acls           = 'NONE',
  $inherit_permissions    = 'NONE',
  $acl_check_permissions  = 'NONE',
  $vfs_objects            = 'NONE',
  $nfs4_mode              = 'NONE',
  $nfs4_acedup            = 'NONE',
  $nfs4_chown             = 'NONE',
  $force_create_mode      = 'NONE',
  $smb_conf_filename      = '/etc/samba/smb.conf',
  $ensure                 = present,
  $priority               = '20'
) {
  include samba

  if ! ($::osfamily in ['Debian']) {
    fail("samba::share does not support osfamily ${::osfamily}")
  }

  realize Concat[$smb_conf_filename]

  concat::fragment { $name:
    ensure  => $ensure,
    target  => $smb_conf_filename,
    content => template('samba/share.erb'),
    order   => $priority,
  }

}

