# Puppet Module Samba

This module aims to enable users to manage a samba server.

## Dependencies

* ripienaar/puppet-concat

# Example

    samba::global{
      "global":
        dns_proxy => "8.8.8.8",
        workgroup => "WORKGROUP";
    }

    samba::dfsroot{
      "media":
        public => "no",
        path   => "/var/samba/media";
    }
