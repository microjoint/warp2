#
class profile
{
  # set up users
  include profile::user::mcampbell
  include profile::user::root

  # set common services
  include openssh
  include dnsmasq

  # set common applications
  include profile::git
  include profile::apps
  include vim

}
