#
class synergy (
  $package          = $synergy::params::package,
  $config           = $synergy::params::config,
  $config_source    = $synergy::params::config_source,
) inherits synergy::params {

  include '::synergy::install'
  include '::synergy::config'

  Class['::synergy::install'] -> Class['::synergy::config']
}
