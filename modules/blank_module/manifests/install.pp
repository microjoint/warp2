#
class module::install inherits module {
  
  package { $package_name:
    ensure => $package_ensure,
  }
}
