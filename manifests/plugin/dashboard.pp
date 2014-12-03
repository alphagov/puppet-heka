# == Class: heka::plugin::dashboard
#
# Setup `DashboardOutput`.
#
# === Parameters
#
# [*host*]
#   Host to listen on.
#   Default: 127.0.0.1
#
# [*port*]
#   Port to listen on.
#   Default: 4352
#
# [*interval*]
#   Update interval in seconds.
#   Default: 5
#
class heka::plugin::dashboard (
  $host = '127.0.0.1',
  $port = 4352,
  $interval = 5,
) {
  heka::plugin { 'dashboard':
    content => template('heka/etc/heka/dashboard.toml.erb'),
  }
}
