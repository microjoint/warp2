#
class profile::pc (
  $symlinks = {}
  ) inherits profile {
  include synergy

  include dropbox
  # setup symlinks
  create_resources( file, $symlinks )
}
