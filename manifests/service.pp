# == Class heka::service
#
# This class is meant to be called from heka
# It ensure the service is running
#
class heka::service {
  service { 'heka':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
