#
class synergy::params {
  $config          = undef
  $config_source   = 'puppet:///modules/synergy/synergy.conf'

  case $::osfamily {
    'Debian': {
      $package = {
        'synergy' => {},
        }
    }
    'Archlinux': {
      $package = {
        'synergy-client' => {},
      }
    }
    'Linux': {
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
