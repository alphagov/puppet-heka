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
class heka::plugin::tcp_output (
  $host,
  $port,
) {
  heka::plugin { 'tcp_output':
    content => template('heka/etc/heka/tcp_output.toml.erb'),
  }
}
