# == Class: heka::plugin::graphite
#
# Setup `CarbonOutput` to send `statmetric` messages to Graphite.
#
# === Parameters
#
# [*host*]
#   Graphite/Carbon host.
#
# [*port*]
#   Graphite/Carbon port.
#   Default: 2003
#
class heka::plugin::graphite (
  $host,
  $port = 2003,
) {
  heka::plugin { 'graphite':
    content => template('heka/etc/heka/graphite.toml.erb'),
  }
}
