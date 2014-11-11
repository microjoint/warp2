#
class profile
{
  #common profile stuff
  include bash
  include profile::git
  include openssh

  include vim
}
