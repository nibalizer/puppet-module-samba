define samba::share(
  $ensure                 = present,
  $acl_check_permissions  = 'NONE',
  $browseable             = 'NONE',
  $comment                = 'NONE',
  $create_mask            = 'NONE',
  $create_mask            = 'NONE',
  $directory_mask         = 'NONE',
  $force_create_mode      = 'NONE',
  $force_directory_mode   = 'NONE',
  $force_group            = 'NONE',
  $force_user             = 'NONE',
  $guest_ok               = 'NONE',
  $guest_only             = 'NONE',
  $inherit_acls           = 'NONE',
  $inherit_permissions    = 'NONE',
  $msdfs_proxy            = 'NONE',
  $msdfs_root             = 'NONE',
  $nfs4_acedup            = 'NONE',
  $nfs4_chown             = 'NONE',
  $nfs4_mode              = 'NONE',
  $path                   = 'NONE',
  $priority               = '20',
  $public                 = 'NONE',
  $smb_conf_filename      = '/etc/samba/smb.conf',
  $vfs_objects            = 'NONE',
  $writeable              = 'NONE'
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

