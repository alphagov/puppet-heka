# == Class heka::service
#
# This class is meant to be called from heka
#
class heka::service {
  $service_ensure = $::heka::service_ensure
  $service_enable = $service_ensure ? {
    stopped => false,
    false   => false,
    default => true,
  }

  service { 'heka':
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => false,
  }
}
