class samba::params {
  case $::osfamily {
    'Debian': {
      $smbservice = 'smbd'
    }
    'Solaris': {
      $smbservice = 'cswsamba'
    }
  }
}
