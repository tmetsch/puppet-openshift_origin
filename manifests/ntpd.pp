# == Class: openshift_origin::ntpd
#
# Provides a basic ntp setup. The clocks between all nodes and broker machines
# must be kept in sync for mcollecitve message to be processed properly
#
class openshift_origin::ntpd {
  ensure_resource( 'package', 'ntpdate', { ensure => 'latest' } )

  class { 'ntp':
    ensure     => running,
    servers    => [ 'time.apple.com iburst',
                    'pool.ntp.org iburst',
                    'clock.redhat.com iburst'],
    autoupdate => true
  }
}