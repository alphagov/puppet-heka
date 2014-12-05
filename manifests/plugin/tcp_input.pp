# == Class: heka::plugin::tcp_input
#
# Setup `TcpInput` to receive messages from another Heka instance.
#
# === Parameters
#
# [*port*]
#   Port to listen on.
#
# [*host*]
#   Host to listen on.
#   Default: '' (all interfaces)
#
class heka::plugin::tcp_input (
  $port,
  $host = '',
) {
  heka::plugin { 'tcp_input':
    content => template('heka/etc/heka/tcp_input.toml.erb'),
  }
}
