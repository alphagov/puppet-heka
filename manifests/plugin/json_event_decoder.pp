# == Class: heka::plugin::json_event_decoder
#
# Install a LUA decoder for json_event entries.
#
class heka::plugin::json_event_decoder {
  file { '/usr/share/heka/lua_decoders/json_event.lua':
    ensure  => present,
    source  => 'puppet:///modules/heka/usr/share/heka/lua_decoders/json_event.lua',
    notify  => Class['heka::service'],
    require => Class['heka::install'],
  }
}
