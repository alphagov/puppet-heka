# == Class heka::install
#
class heka::install {
  $package_ensure = $::heka::package_ensure

  package { 'heka':
    ensure => $package_ensure,
  }
}
