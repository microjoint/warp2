#
class module (
  $config         = $module::params::config,
  $package_name   = $module::params::package_name,
  $package_ensure = $module::params::package_ensure,
) inherits module::params {

  if $config 
    validate_hash( $config )
  }

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'module::begin': } ->
  class { '::module::install': } ->
  class { '::module::config': } ~>
  class { '::module::service': } ->
  anchor { 'module::end': }
}
