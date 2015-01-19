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
# [*matcher_additional*]
#   Additional `message_matcher` expressions to filter messages that you
#   don't want to send to another host.
#   Default: ''
#
class heka::plugin::tcp_output (
  $host,
  $port,
  $enable = true,
  $matcher_additional = '',
) {
  validate_bool($enable)

  if $enable {
    heka::plugin { 'tcp_output':
      content => template('heka/etc/heka/tcp_output.toml.erb'),
    }
  }
}
