#
class profile::user::mcampbell (
    $username = 'mcampbell',
    $comment  = 'Marcus Campbell',
    $uid      = '1000',
    $gid      = '1000',
    $groups   = hiera('profile::user::mcampbell::groups'),
    $home     = '/home/mcampbell',
    $password = hiera('profile::user::mcampbell::password'),
    $config   = hiera_hash(profile::user::mcampbell::config),
    $defaults = {
      owner => 'mcampbell',
      group => 'mcampbell' },
) {

  FILE {
    owner => 'mcampbell',
    group => 'mcampbell',
  }

  file { '/home/mcampbell/.clusterssh/config':
    ensure  => file,
    content => template('profile/cssh.config.erb'),
  }

  file { '/home/mcampbell/.clusterssh/clusters':
    ensure  => file,
    content => template('profile/cssh.clusters.erb'),
  }

  file { '/home/mcampbell/.xinitrc':
    ensure  => file,
    content => template('profile/xinitrc.erb')
  }

  $colorscheme = hiera('vim::colorscheme')
  file { '/home/mcampbell/.vimrc':
    ensure  => file,
    content => template('profile/vimrc.erb')
  }

  exec{'vim_update_plugins':
    path        => ['/usr/bin'],
    cwd         => '/home/mcampbell',
    command     => 'vim +PluginInstall +qall',
    subscribe   => File['/home/mcampbell/.vimrc'],
    environment => ['HOME=/home/mcampbell'],
    refreshonly => true,
    user        => 'mcampbell',
  }

}
