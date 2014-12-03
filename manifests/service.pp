# == Class heka::service
#
# This class is meant to be called from heka
# It ensure the service is running
#
class heka::service {
  include heka::params

  service { $heka::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
