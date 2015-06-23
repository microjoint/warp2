# This is the common profile applied to all machines
class profile
{

  # we always setup root user
  include profile::user::root

  # set common services
  include openssh

  # set common core applications
  include profile::git

  # install all the applications
  include profile::apps

  # Bring on the vim
  include vim

  # set up common configuration
  $config = hiera_hash(profile::config, undef)
  if $config {
    create_resources( file, $config)
  }

  include profile::hosts
  include profile::timezone

}
