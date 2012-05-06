define samba::dfsroot(
  $msdfs_root           = 'NONE',
  $msdfs_proxy          = 'NONE',
  $comment              = 'NONE',
  $path                 = 'NONE',
  $public               = 'NONE',
  $smb_conf_filename    = '/etc/samba/smb.conf',
  $ensure               = present,
  $priority             = '20'
) {
  include samba

  if ! ($::osfamily in ['Debian']) {
    fail("samba::dfsroot does not support osfamily ${::osfamily}")
  }

  realize Concat[$smb_conf_filename]

  concat::fragment { $name:
    ensure  => $ensure,
    target  => $smb_conf_filename,
    content => template('samba/dfsroot.erb'),
    order   => $priority,
  }

}
