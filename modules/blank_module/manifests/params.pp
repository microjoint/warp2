#
class module::params (
  $config = undef,
  $package_name = undef,
) inherits module {

  $default_config = {  }

  case $::osfamily {
    'Debian': {
      $config       = $default_config
      $package_name = 'openssh-server'
    }
    'Linux': {
      # Account for distributions that don't have $::osfamily specific settings.
      # Before Facter 1.7.0 Gentoo ded not have its own $::osfamily
      case $::operatingsystem {
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
