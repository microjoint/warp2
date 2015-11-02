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

  exec{'vim_update_plugins_root':
    path        => ['/usr/bin'],
    cwd         => '/root',
    command     => 'vim +PluginInstall +qall',
    subscribe   => File['/root/.vimrc'],
    environment => ['HOME=/root'],
    refreshonly => true,
  }

}
