#
class profile::pc (
  $symlinks = {}
  ) inherits profile {

  include profile::user::mcampbell
  include profile::user::root

  include synergy

  # include dropbox
  # setup symlinks
  create_resources( file, $symlinks )

  #screensaver
  include xscreensaver

  include profile::apps
}
