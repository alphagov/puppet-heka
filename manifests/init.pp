# == Class: heka
#
# Full description of class heka here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class heka {

  # validate parameters here

  anchor { 'heka::begin': } ->
  class { 'heka::install': } ->
  class { 'heka::config': }
  class { 'heka::service': } ->
  anchor { 'heka::end': }

  Anchor['heka::begin']  ~> Class['heka::service']
  Class['heka::install'] ~> Class['heka::service']
  Class['heka::config']  ~> Class['heka::service']
}
