#
class profile::etc (
  $dns_search = hiera('dns_search', ''),
) {
  $mnt_config = hiera_hash(profile::etc::mnt_config, '')
  $config = hiera_hash(profile::etc::config)

  if $mnt_config {
    create_resources( mount, $mnt_config )
  }

  if $config {
    create_resources( file, $config )
  }


  file { '/etc/resolv.conf':
    ensure  => file,
    content => template('profile/resolv.conf.erb'),
  }

}
