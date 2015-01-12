#
class profile
{

  # set up users
  include profile::user::mcampbell
  include profile::user::root


  # set common services
  include openssh
  include pdnsd

  # set common applications
  include profile::git

  include profile::apps
  include vim

  # set up common configuration
  $config = hiera_hash(profile::config, undef)
  if $config {
    create_resources( file, $config)
  }
  include hosts
  include timezone

}
