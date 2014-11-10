#
class xscreensaver (
  $config = $xscreensaver::params::config
) inherits xscreensaver::params {

  include '::xscreensaver::install'
  include '::xscreensaver::config'

  Class['::xscreensaver::install'] -> Class['::xscreensaver::config']
}
