#
class profile::user::root (
  $config = undef,
) {
  if $config {
    create_resources( file, $config )
  }
  $colorscheme = hiera('vim::colorscheme')
  file { '/root/.vimrc':
    ensure  => file,
    content => template('profile/vimrc.erb')
  }
}
