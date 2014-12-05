# == Class heka::install
#
class heka::install {
  package { 'heka':
    ensure => present,
  }
}
