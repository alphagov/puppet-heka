# == Class heka::params
#
# This class is meant to be called from heka
# It sets variables according to platform
#
class heka::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'heka'
      $service_name = 'heka'
    }
    'RedHat', 'Amazon': {
      $package_name = 'heka'
      $service_name = 'heka'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
