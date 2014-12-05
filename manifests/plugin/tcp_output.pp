# == Class: heka::plugin::tcp_output
#
# Setup `TcpOutput` to send messages to another Heka instance.
#
# === Parameters
#
# [*host*]
#   Host to send to.
#
# [*port*]
#   Port to send to.
#
# [*enable*]
#   Disable this plugin. Useful for overriding with hiera on an aggregation
#   machine that also has `heka::plugin::tcp_input`.
#   Default: false
#
class heka::plugin::tcp_output (
  $host,
  $port,
  $enable = true,
) {
  validate_bool($enable)

  if $enable {
    heka::plugin { 'tcp_output':
      content => template('heka/etc/heka/tcp_output.toml.erb'),
    }
  }
}
