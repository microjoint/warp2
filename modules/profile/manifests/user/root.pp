# This will set up all the configuration we want for the root user
class profile::user::root (
  $dns_search = hiera('dns_search', ''),
  $colorscheme = hiera('vim::colorscheme', 'ron')
) {
  $config = hiera_hash(profile::user::root::config)
  $mnt_config = hiera_hash(profile::user::root::mnt_config, '')
  if $config {
    create_resources( file, $config )
  }
  if $mnt_config {
    create_resources( mount, $mnt_config )
  }

  # All my vim goodness
  file { '/root/.vimrc':
    ensure  => file,
    content => template('profile/vimrc.erb')
  }

  file { '/etc/resolv.conf':
    ensure  => file,
    content => template('profile/resolv.conf.erb'),
  }

}
