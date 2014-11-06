#
class synergy::install inherits synergy {

  $defaults = {
    ensure => latest
  }

  create_resources( package, $package, $defaults )

}
