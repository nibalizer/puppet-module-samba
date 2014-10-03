class samba(
  $smb_conf_filename    = $samba::params::smb_conf_filename,
) inherits samba::params {

  package { $samba::params::smbpackage:
    name     => $samba::params::smbpackage,
    ensure   => latest,
    provider => $osfamily ? {
      'Solaris' => pkgutil,
      default   => undef,
    }
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
