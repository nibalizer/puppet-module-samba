# Puppet Module Samba

This module aims to enable users to manage a samba server.

[![Build Status](https://secure.travis-ci.org/pdxcat/puppet-module-samba.png?branch=master)](http://travis-ci.org/pdxcat/puppet-module-samba)

## Dependencies

* puppetlabs/puppetlabs-concat

# Example

```puppet
samba::global{
  'global':
    dns_proxy => '8.8.8.8',
    workgroup => 'WORKGROUP';
}

samba::dfsroot{
  'media':
    public => 'no',
    path   => '/var/samba/media';
}
```
