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

  # set up vim's vundle
  #vcsrepo {'/home/root/.vim/undle/Vundle.vim':
  #  ensure   => latest,
  #  provider => git,
  #  source   => 'https://github.com/gmarik/Vundle.vim.git',
  #  notify   => Exec['vim_vundle'],
  #  owner    => 'root',
  #  group    => 'root',
  #}

  #exec { 'vim_vundle_root':
  #  path        => ['/usr/bin/', '/bin'],
  #  cwd         => '/home/root/',
  #  command     => '/usr/bin/vim +PluginInstall +qall',
  #  provider    => 'shell',
  #  environment => 'HOME=/root',
  #  user        => 'root',
  #  subscribe   => File['/root/.vimrc'],
  #  refreshonly => true,
  #}
}
