# This will set up all the configuration we want for the root user
class profile::user::root (
  $colorscheme = hiera('vim::colorscheme', 'ron')
) {

  $config = hiera_hash(profile::user::root::config)

  if $config {
    create_resources( file, $config )
  }

  # All my vim goodness
  file { '/root/.vimrc':
    ensure  => file,
    content => template('profile/vimrc.erb')
  }
}
