#
class profile::pc (
  $symlinks = {}
  ) inherits profile {
  include synergy

  # include dropbox
  # setup symlinks
  create_resources( file, $symlinks )

  #screensaver
  include xscreensaver

  include profile::apps
}
