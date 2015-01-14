# == Class: heka::restart
#
# Restart (not HUP) the Heka service.
#
class heka::restart {
  exec { '/usr/sbin/service heka restart':
    refreshonly => true,
  }
}
