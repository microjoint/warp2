
class xscreensaver::install inherits xscreensaver {

  $defaults = { 
    ensure => latest
  }

  create_resources( package, $package, $defaults )

}
