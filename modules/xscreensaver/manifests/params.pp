#
class xscreensaver::params {
  $config = undef

  case $::osfamily {
    'Debian': {
      $package = {
        'xscreensaver' => {},
        'xscreensaver-data' => {},
        'xscreensaver-data-extra' => {},
        'xscreensaver-gl' => {},
        'xscreensaver-gl-extra' => {},
        }
    }
    'Archlinux': {
      $package = {
        'xscreensaver' => {},
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
