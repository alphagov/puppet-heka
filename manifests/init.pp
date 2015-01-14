# == Class: heka
#
# Manage heka: https://github.com/mozilla-services/heka
#
# === Parameters
#
# [*package_ensure*]
#   Ensure parameter to pass to the package.
#   Default: present
#
# [*service_ensure*]
#   Ensure parameter to pass to the service.
#   Default: running
#
class heka (
  $package_ensure = present,
  $service_ensure = running,
) {
  include heka::restart

  anchor { 'heka::begin': } ->
  class { 'heka::install': } ->
  class { 'heka::config': }
  class { 'heka::service': } ->
  anchor { 'heka::end': }

  Anchor['heka::begin']  ~> Class['heka::service']
  Class['heka::install'] ~> Class['heka::service']
  Class['heka::config']  -> Class['heka::service']
}
