# This will set up a laptop
class profile::laptop inherits profile {

  include laptop_mode

  # we want to know when the lid is closed
  file { '/etc/acpi/events/lid':
    ensure => file,
    source => 'puppet:///modules/profile/etc/acpi/lid',
  }

}
