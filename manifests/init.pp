class samba(
  $smb_conf_filename    = '/etc/samba/smb.conf',
) {
  include concat::setup
  include samba::params

  package { 'samba':
    ensure => latest,
  }

  service {$samba::params::smbservice:
    name   => $samba::params::smbservice,
    ensure => running,
    enable => true,
  }

  @concat { $smb_conf_filename:
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service[$samba::params::smbservice],
  }

}
