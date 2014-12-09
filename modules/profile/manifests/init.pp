#
class profile
{
  # set up users
  include profile::user::mcampbell
  include profile::user::root

  # set common services
  include openssh

  # set common applications
  include bash
  include profile::git
  include profile::apps
  include vim

}
