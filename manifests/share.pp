define samba::share(
  $msdfs_root,
  $msdfs_proxy,
  $comment,
  $path,
  $writeable,
  $force_create_mode,
  $force_directory_mode,
  $force_group,
  $public,
  $create_mask,
  $directory_mask,
  $inherit_acls,
  $inherit_permissions,
  $acl_check permissions,
  $vfs_objects,
  $nfs4_mode,
  $nfs4_acedup,
  $nfs4_chown,
  $smb_conf_filename      = '/etc/samba/smb.conf',
  $ensure                 = present,
  $priority               = '20'
) {
  include samba

  if ! ($osfamily in ['Debian']) {
    fail("pam::access does not support osfamily $osfamily")
  }

  realize Concat["$smb_conf_filename"]

  concat::fragment { $name:
    ensure  => $ensure,
    target  => $smb_conf_filename,
    content => template('samba/share.erb'),
    order   => $priority,
  }

}

