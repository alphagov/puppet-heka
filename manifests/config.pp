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
}
