# == Define: heka::plugin
#
# Configure a heka plugin.
#
# === Parameters
#
# [*content*]
#   File content for the plugin config.
#   Default: undef
#
# [*source*]
#   File source for the plugin config.
#   Default: undef
#
define heka::plugin (
  $content = undef,
  $source = undef,
) {
  include heka

  if !($content or $source) {
    fail('content and source param must be provided')
  }
  if ($content and $source) {
    fail('content and source params are mutually exclusive')
  }

  file { "/etc/heka/${name}.toml":
    ensure  => file,
    content => $content,
    source  => $source,
    notify  => Class['heka::service'],
    require => Class['heka::config'],
  }
}
