# == Class: heka
#
# Manage heka: https://github.com/mozilla-services/heka
#
# === Parameters
#
class heka {
  anchor { 'heka::begin': } ->
  class { 'heka::install': } ->
  class { 'heka::config': }
  class { 'heka::service': } ->
  anchor { 'heka::end': }

  Anchor['heka::begin']  ~> Class['heka::service']
  Class['heka::install'] ~> Class['heka::service']
  Class['heka::config']  ~> Class['heka::service']
}
