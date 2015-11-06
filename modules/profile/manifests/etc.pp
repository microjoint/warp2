#
class profile::etc (
  $dns_search = hiera('dns_search', ''),
  $resolv_conf = hiera('resolv_conf', undef)
) {
  $mnt_config = hiera_hash(profile::etc::mnt_config, '')
  $mnt_defaults = hiera_hash(profile::etc::mnt_config_defaults, '')
  $config = hiera_hash(profile::etc::config, mnt_defaults)

  if $config {
    create_resources( file, $config )
  }

  if $mnt_config {
    create_resources( mount, $mnt_config )
  }

  if $resolv_conf {
    file { '/etc/resolv.conf':
      ensure  => file,
      content => template('profile/resolv.conf.erb'),
    }
  }

}
