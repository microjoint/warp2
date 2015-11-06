# This is the common profile applied to all machines
class profile
{

  # we setup users
  $users = hiera_hash('users')
  if $users {
    create_resources( profile::user, $users)
  }



  # any global configuration
  include profile::etc

  # set common services
  include openssh
  class { '::ntp':
    servers  => ['0.europe.pool.ntp.org',
    '1.europe.pool.ntp.org',
    '2.europe.pool.ntp.org',
    '3.europe.pool.ntp.org'],
    restrict => ['127.0.0.1'],
  }

  # set common core applications
  include profile::git

  # install all the applications
  include profile::apps

  # Bring on the vim
  include vim

  # repos to clone
  include profile::repos

  # set up common configuration
  $config = hiera_hash(profile::config, undef)
  if $config {
    create_resources( file, $config)
  }

  include profile::hosts
  include profile::timezone

  # fixes for stuff that don't work right
  include profile::fixes

  Class['vim'] -> Class['profile::repos'] -> Class['profile::fixes']

}
