# == Class heka::config
#
# This class is called from heka
#
class heka::config {
  file { '/etc/heka':
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
  }

  file { '/etc/init/heka.conf':
    ensure => file,
    source => 'puppet:///modules/heka/etc/init/heka.conf',
  }
}
