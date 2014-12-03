# == Class heka::install
#
class heka::install {
  include heka::params

  package { $heka::params::package_name:
    ensure => present,
  }
}
