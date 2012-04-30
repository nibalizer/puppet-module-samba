class samba(
  $smb_conf_filename    = '/etc/samba/smb.conf',
) {
  include concat::setup

  @concat { $smb_conf_filename:
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}
