#
class profile::user::mcampbell
{

  user {'mcampbell':
    ensure   => present,
    comment  => 'Marcus Campbell',
    gid      => '1000',
    groups   => hiera('profile::user::mcampbell::groups'),
    home     => '/home/mcampbell',
    shell    => '/bin/bash',
    uid      => '1000',
    password => hiera('profile::user::mcampbell::password'),
  }

  $config = hiera_hash(profile::user::mcampbell::config)

  FILE {
    owner => 'mcampbell',
    group => 'mcampbell',
  }

  $defaults = {
    owner => 'mcampbell',
    group => 'mcampbell',
  }

  create_resources( file, $config, $defaults )

  file { '/home/mcampbell/.clusterssh':
    ensure => directory,
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

}
