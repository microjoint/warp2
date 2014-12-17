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
  $hosts = hiera_hash('hosts', undef)
  if $hosts
  {
    create_resources(Host, $hosts)
  }

}
