# This is the common profile applied to all machines
class profile
{

  # we always setup root user
  include profile::user::root

  # any global configuration
  include profile::etc

  # set common services
  include openssh

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
