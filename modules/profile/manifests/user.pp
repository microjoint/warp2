# Creates users and their configurations files
define profile::user (
  $username       = undef,
  $home           = undef,
  $password       = undef,
  $comment        = undef,
  $uid            = undef,
  $gid            = undef,
  $groups         = undef,
  $config         = undef,
  $colorscheme    = 'ron',
  $cssh_config    = undef,
  $cluster_config = undef,
  $xinitrc        = undef,
  $xrandr         = undef,
  $vim_beautify   = false,
) {

  user { $name:
    ensure   => present,
    comment  => $comment,
    uid      => $uid,
    gid      => $gid,
    shell    => '/bin/bash',
    groups   => $groups,
  }

  File {
    owner => $name,
    group => $name,
  }

  create_resources( file, $config )

  if $vim_beautify {
    file { "${home}/.vimrc":
      ensure  => file,
      content => template('profile/vimrc.erb')
    }

    exec{"${name}_vim_update_plugins":
      path        => ['/usr/bin'],
      cwd         => $home,
      command     => 'vim +PluginInstall +qall',
      subscribe   => File["${home}/.vimrc"],
      environment => ["HOME=${home}"],
      refreshonly => true,
      user        => $name,
    }
  }

  if $cssh_config {
    file { "${home}/.clusterssh/config":
      ensure  => file,
      content => template($cssh_config),
    }
  }

  if $cluster_config {
    file { "${home}/.clusterssh/clusters":
      ensure  => file,
      content => template($cluster_config),
    }
  }

  if $xinitrc {
    file { "${home}/.xinitrc":
      ensure  => file,
      content => template($xinitrc)
    }
  }

  if $::bashrc {
    $pre_paths = hiera_hash('user::pre_path')
    $post_paths = hiera_hash('user::post_path')
    $cd_paths = hiera_hash('user::cd_path')
    file { "${home}/.bashrc":
      ensure  => file,
      content => template($::bashrc)
    }
  }

}
