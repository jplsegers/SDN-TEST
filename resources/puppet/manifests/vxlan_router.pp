####################################################
#import "base.pp"

include apt

### Export Env: Global %PATH for "Exec"
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin" ] }

resources { "firewall":
  purge => true
}

firewall { 's1 MASQUERADE':
  chain    => 'POSTROUTING',
  jump     => 'MASQUERADE',
  proto    => 'all',
  outiface => "eth0",
  source   => '192.168.1.0/24',
  table    => 'nat',
}

firewall { 's2 MASQUERADE':
  chain    => 'POSTROUTING',
  jump     => 'MASQUERADE',
  proto    => 'all',
  outiface => "eth0",
  source   => '192.168.2.0/24',
  table    => 'nat',
}
