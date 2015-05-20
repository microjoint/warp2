# This will set up all the configuration we want for the root user
class profile::user::root (
  $config = undef,
  $colorscheme = hiera('vim::colorscheme', 'ron')
) {
  if $config {
    create_resources( file, $config )
  }

  # All my vim goodness
  file { '/root/.vimrc':
    ensure  => file,
    content => template('profile/vimrc.erb')
  }
}
